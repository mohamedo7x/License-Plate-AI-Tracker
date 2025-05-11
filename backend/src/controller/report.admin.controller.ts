import {
  executeNonQuery,
  executeQuery,
  executeSingleQuery,
} from '../utils/orm.util'
import asyncHandler from '../middleware/asyncHandler'
import { Request, Response } from 'express'
import { formatDate } from '../utils/dateFormat.util'

export const getAllReports = asyncHandler(
  async (req: Request, res: Response) => {
    const result = await executeQuery(
      'SELECT id , title , date , type , description , status FROM police_reports',
    )
    if (result.success && result.data) {
      const userData = result.data.map((report) => {
        return {
          ...report,
          date: formatDate(report.date),
        }
      })
      res.status(200).json({
        success: true,
        data: userData || [],
      })
    }
  },
)

export const getSpesificReport = asyncHandler(
  async (req: Request, res: Response) => {
    const reportId = Number(req.params.id)
    const result = await executeSingleQuery(
      'SELECT id , title , date , type , description , status FROM police_reports WHERE id = ?',
      [reportId],
    )
    if (result.success && result.data) {
      const userData = result.data.map((report) => {
        return {
          ...report,
          date: formatDate(report.date),
        }
      })
      res.status(200).json({
        success: true,
        data: userData || [],
      })
    } else {
      res.status(404).json({
        success: false,
        message:
          'Sorry, no report found for the provided ID. Please verify the ID and try again.',
      })
    }
  },
)

export const deleteReport = asyncHandler(
  async (req: Request, res: Response) => {
    const reportId = Number(req.params.id)
    const result = await executeNonQuery(
      'DELETE FROM police_reports WHERE id = ?',
      [reportId],
    )
    if (result.success && (result.affectedRows ?? 0) > 0) {
      res.status(200).json({
        success: true,
        message: '✅ The report has been successfully removed.',
      })
    } else {
      res.status(404).json({
        success: false,
        message:
          'Sorry, no report found for the provided ID. Please verify the ID and try again.',
      })
    }
  },
)

export const changeReportStatus = asyncHandler(
  async (req: Request, res: Response) => {
    const reportId = Number(req.params.id)
    const { status } = req.body
    const validStatuses = ['complete', 'close', 'processing']

    if (!validStatuses.includes(status)) {
      res.status(400).json({
        success: false,
        message: `Invalid status value. Allowed values are: ${validStatuses.join(', ')}.`,
      })
      return
    }

    const result = await executeNonQuery(
      'UPDATE police_reports SET status = ? WHERE id = ?',
      [status, reportId],
    )

    if (result.success && (result.affectedRows ?? 0) > 0) {
      res.status(200).json({
        success: true,
        message: '✅ The report status has been successfully updated.',
      })
    } else {
      res.status(404).json({
        success: false,
        message:
          'No report found with the specified ID. Status update was not performed.',
      })
    }
  },
)
