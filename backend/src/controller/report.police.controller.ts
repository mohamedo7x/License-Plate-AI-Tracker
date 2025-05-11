import {
  executeNonQuery,
  executeQuery,
  executeSingleQuery,
} from '../utils/orm.util'
import { Request, Response } from 'express'
import asyncHandler from '../middleware/asyncHandler'
import { PoliceUser } from '../model/police_user.model'
import { formatDate } from '../utils/dateFormat.util'

export const getMyReports = asyncHandler(
  async (req: Request, res: Response) => {
    const user = (req as any).user
    const result = await executeQuery<PoliceUser>(
      'SELECT id,title , date , type , description , status FROM police_reports WHERE police_id = ?',
      [user.id],
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
        message: 'No reports found for the user',
      })
    }
  },
)

export const getSpesificReport = asyncHandler(
  async (req: Request, res: Response) => {
    const user = (req as any).user
    const reportId = Number(req.params.id)
    const result = await executeSingleQuery<PoliceUser>(
      'SELECT id ,title, date , type , description , status FROM police_reports WHERE police_id = ? AND id = ?',
      [user.id, reportId],
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
        message: 'No reports found for the user',
      })
    }
  },
)

export const CreateReport = asyncHandler(
  async (req: Request, res: Response) => {
    const { title, type, description } = req.body
    const user = (req as any).user
    const result = await executeNonQuery(
      'INSERT INTO police_reports (title,police_id, type, description) VALUES (?,?, ?, ?)',
      [title, user.id, type, description],
    )
    if (result.success) {
      res.status(201).json({
        success: true,
        message: 'Report created successfully',
      })
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to create report',
      })
    }
  },
)
exports = {
  getMyReports,
  CreateReport,
  getSpesificReport,
}
