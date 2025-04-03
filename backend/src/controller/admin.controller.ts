import asyncHandler from '../middleware/asyncHandler'
import { AdminUser } from '../model/admin_user.model'
import { Request, Response } from 'express'
import {
  executeNonQuery,
  executeQuery,
  executeSingleQuery,
} from '../utils/query.util'
import { RowDataPacket } from 'mysql2'
import bcrypt from 'bcrypt'
import { generateAdminJWTToken } from '../auth/admin.access'

interface AdminUserRow extends AdminUser, RowDataPacket {}

interface CountResult extends RowDataPacket {
  total: number
}

const createAdmin = asyncHandler(
  async (req: Request<{}, {}, Partial<AdminUser>>, res: Response) => {
    const { name, img_profile, email, password_hash } = req.body
    const hashedPassword = await bcrypt.hash(
      password_hash || '',
      parseInt(process.env.SALT_PASSWORD || '10'),
    )

    const query = `INSERT INTO admin_users (name, img_profile, email, password_hash, role, status, created_at) 
                   VALUES (?, ?, ?, ?, ?, ?, ?)`
    const values = [
      name,
      img_profile,
      email,
      hashedPassword,
      'superadmin',
      'active',
      new Date(),
    ]

    const result = await executeNonQuery(query, values)
    if (result.success) {
      res.status(201).json({
        message: 'Admin created successfully',
        affectedRows: result.affectedRows,
      })
    } else {
      res.status(500).json({ error: result.error })
    }
  },
)

const getAdmin = asyncHandler(async (req: Request, res: Response) => {
  const { id } = req.params
  const result = await executeSingleQuery<AdminUserRow>(
    'SELECT * FROM admin_users WHERE id = ?',
    [id],
  )

  if (result.success && result.data && result.data.length > 0) {
    res.json(result.data[0])
  } else {
    res.status(404).json({ error: 'Admin not found' })
  }
})

const getAllAdmins = asyncHandler(async (req: Request, res: Response) => {
  const page = parseInt(req.query.page as string) || 1
  const limit = parseInt(req.query.limit as string) || 10
  const offset = (page - 1) * limit

  const countResult = await executeSingleQuery<CountResult>(
    'SELECT COUNT(*) as total FROM admin_users'
  )

  // Get paginated data
  const result = await executeQuery<AdminUserRow>(
    `SELECT id, name, email, role, status, img_profile, last_login, created_at, updated_at 
     FROM admin_users 
     ORDER BY created_at  
     LIMIT ? OFFSET ?`,
    [limit, offset]
  )

  if (result.success && result.data && countResult.success && countResult.data) {
    res.json({
      data: result.data,
      pagination: {
        total: countResult.data[0].total,
        page,
        limit,
        totalPages: Math.ceil(countResult.data[0].total / limit)
      }
    })
  } else {
    res.status(500).json({ error: result.error || countResult.error })
  }
})

const updateAdmin = asyncHandler(async (req: Request, res: Response) => {
  const { id } = req.params
  const { name, img_profile, email, status } = req.body as Partial<AdminUser>

  const updates: string[] = []
  const values: any[] = []

  if (name !== undefined) {
    updates.push('name = ?')
    values.push(name)
  }
  if (img_profile !== undefined) {
    updates.push('img_profile = ?')
    values.push(img_profile)
  }
  if (email !== undefined) {
    updates.push('email = ?')
    values.push(email)
  }
  if (status !== undefined) {
    updates.push('status = ?')
    values.push(status)
  }

  updates.push('updated_at = ?')
  values.push(new Date())

  if (updates.length === 1) {
    res.status(400).json({ error: 'No fields to update' })
    return
  }

  values.push(id)

  const query = `UPDATE admin_users 
                 SET ${updates.join(', ')}
                 WHERE id = ?`

  const result = await executeNonQuery(query, values)
  if (result.success) {
    res.json({
      message: 'Admin updated successfully',
      affectedRows: result.affectedRows,
    })
  } else {
    res.status(500).json({ error: result.error })
  }
})

const deleteAdmin = asyncHandler(async (req: Request, res: Response) => {
  const { id } = req.params
  const result = await executeNonQuery('DELETE FROM admin_users WHERE id = ?', [
    id,
  ])

  if (result.success) {
    res.json({
      message: 'Admin deleted successfully',
      affectedRows: result.affectedRows,
    })
  } else {
    res.status(500).json({ error: result.error })
  }
})

const loginAdmin = asyncHandler(async (req: Request, res: Response) => {
  const { email, password } = req.body

  const result = await executeSingleQuery<AdminUserRow>(
    'SELECT * FROM admin_users WHERE email = ?',
    [email],
  )

  if (!result.success || !result.data || result.data.length === 0) {
    res.status(401).json({ error: 'Invalid credentials' })
    return
  }

  const admin = result.data[0]

  if (admin.status !== 'active') {
    res.status(403).json({ error: 'Account is not active' })
    return
  }

  const isValidPassword = await bcrypt.compare(password, admin.password_hash)

  if (!isValidPassword) {
    res.status(401).json({ error: 'Invalid credentials' })
    return
  }

  await executeNonQuery('UPDATE admin_users SET last_login = ? WHERE id = ?', [
    new Date(),
    admin.id,
  ])

  const token = generateAdminJWTToken(admin)

  res.json({
    message: 'Login successful',
    token,
    admin: {
      id: admin.id,
      name: admin.name,
      email: admin.email,
      role: admin.role,
      status: admin.status,
    },
  })
})

export {
  createAdmin,
  getAdmin,
  getAllAdmins,
  updateAdmin,
  deleteAdmin,
  loginAdmin,
}
