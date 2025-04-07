import {
  executeNonQuery,
  executeQuery,
  executeSingleQuery,
} from '../utils/orm.util'
import { Request, Response } from 'express'

export const createReport = async (req: Request, res: Response) => {
  const { title, description, status, priority, assigned_to, created_by } =
    req.body
  const createReport = await executeNonQuery(
    `INSERT INTO reports (title, description, status, priority, assigned_to, created_by) VALUES (?, ?, ?, ?, ?, ?)`,
    [title, description, status, priority, assigned_to, created_by],
  )
  res.status(201).json({
    message: 'Report created successfully',
    data: createReport,
  })
}
