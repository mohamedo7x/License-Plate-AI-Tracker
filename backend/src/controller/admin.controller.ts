import { getConnection } from '../database/Database'
import asyncHandler from '../middleware/asyncHandler'
import { AdminUser } from '../model/admin_user.model'
import { Request, Response } from 'express'

const createAdmin = asyncHandler(
  async (req: Request<{}, {}, Partial<AdminUser>>, res: Response) => {
      const db = await getConnection();
      const { name, img_profile, email, password_hash } = req.body
      const insertQuery = `INSERT INTO admin_users (name, img_profile, email, password_hash, role, status, created_at) 
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

      const [row] =await db.execute(insertQuery,values);
      res.status(201).json({ message: 'Admin created successfully' })
  }
)

export { createAdmin }
