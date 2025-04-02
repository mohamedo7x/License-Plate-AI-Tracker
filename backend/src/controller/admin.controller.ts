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
import { generateJWTToken } from '../auth/auth.access'
import { User } from '../model/user.model'

interface AdminUserRow extends AdminUser, RowDataPacket {}

const createAdmin = asyncHandler(
  async (req: Request<{}, {}, Partial<AdminUser>>, res: Response) => {
    const { name, img_profile, email, password_hash } = req.body
    const query = `INSERT INTO admin_users (name, img_profile, email, password_hash, role, status, created_at) 
                   VALUES (?, ?, ?, ?, ?, ?, ?)`
    const values = [
      name,
      img_profile,
      email,
      password_hash,
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
  const result = await executeQuery<AdminUserRow>(
    'SELECT * FROM admin_users ORDER BY created_at DESC',
  )

  if (result.success && result.data) {
    res.json(result.data)
  } else {
    res.status(500).json({ error: result.error })
  }
})

const updateAdmin = asyncHandler(async (req: Request, res: Response) => {
  const { id } = req.params
  const { name, img_profile, email, status } = req.body as Partial<AdminUser>

  const query = `UPDATE admin_users 
                   SET name = ?, img_profile = ?, email = ?, status = ?, updated_at = ?
                   WHERE id = ?`
  const values = [name, img_profile, email, status, new Date(), id]

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

const loginAdmin = async (req: Request, res: Response): Promise<void> => {
  try {
    const { email, password } = req.body

    const result = await executeSingleQuery<AdminUserRow>(
      'SELECT * FROM admin_users WHERE email = ?',
      [email]
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

    await executeQuery(
      'UPDATE admin_users SET last_login = ? WHERE id = ?',
      [new Date(), admin.id]
    )

    const userForToken: User = {
      id: admin.id || 0,
      name: admin.name,
      username: admin.email,
      password_hash: admin.password_hash,
      role_id: admin.role_id || 1,
      active: admin.status === 'active',
      last_login: new Date()
    }

    const token = generateJWTToken(userForToken)

    res.json({
      message: 'Login successful',
      token,
      admin: {
        id: admin.id,
        name: admin.name,
        email: admin.email,
        role: admin.role,
        status: admin.status
      }
    })
  } catch (error) {
    console.error('Login error:', error)
    res.status(500).json({ error: 'Internal server error' })
  }
}

export {
  createAdmin,
  getAdmin,
  getAllAdmins,
  updateAdmin,
  deleteAdmin,
  loginAdmin
}
