import asyncHandler from '../middleware/asyncHandler'
import { AdminUser } from '../model/admin_user.model'
import { AdminResponse, AdminListResponse } from '../model/admin.response.model'
import { Request, Response } from 'express'
import {
  executeNonQuery,
  executeQuery,
  executeSingleQuery,
} from '../utils/orm.util'
import { RowDataPacket } from 'mysql2'
import bcrypt from 'bcrypt'
import { generateAdminJWTToken } from '../auth/admin.access'
import { PoliceUserResponse, PoliceUserListResponse } from '../model/police_user.response.model'
import { isPoliceUserExist } from '../auth/user.access'
import * as path from 'path'
import * as fs from 'fs'

interface AdminUserRow extends AdminUser, RowDataPacket {}

interface CountResult extends RowDataPacket {
  total: number
}

interface PoliceUserRow extends RowDataPacket {
  id: number
  military_id: string
  name: string
  rank: string
  department: string
  active: boolean
  username: string
  phone_number?: string | null
  img_profile?: string | null
  last_login?: Date | null
  created_at?: Date
  updated_at?: Date
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
      img_profile || 'default.png',
      email,
      hashedPassword,
      'admin',
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

const getAdmin = asyncHandler(async (req: Request, res: Response<AdminResponse>) => {
  const { id } = req.params
  const result = await executeSingleQuery<AdminUserRow>(
    'SELECT * FROM admin_users WHERE id = ?',
    [id],
  )

  if (result.success && result.data && result.data.length > 0) {
    const admin = result.data[0]
    const response: AdminResponse = {
      id: admin.id!,
      name: admin.name,
      email: admin.email,
      role: admin.role,
      status: admin.status,
      img_profile: (req.protocol + '://' + req.get('host') + '/uploads/images/admin_users/' + admin.img_profile),
      last_login: admin.last_login,
      created_at: admin.created_at,
      updated_at: admin.updated_at
    }
    res.json(response)
  } else {
    res.status(404).json({ error: 'Admin not found' } as any)
  }
})

const getAllAdmins = asyncHandler(async (req: Request, res: Response<AdminListResponse>) => {
  const page = parseInt(req.query.page as string) || 1
  const limit = parseInt(req.query.limit as string) || 10
  const offset = (page - 1) * limit

  const countResult = await executeSingleQuery<CountResult>(
    'SELECT COUNT(*) as total FROM admin_users',
  )

  const result = await executeQuery<AdminUserRow>(
    `SELECT id, name, email, role, status, img_profile, last_login, created_at, updated_at 
     FROM admin_users 
     ORDER BY created_at  
     LIMIT ? OFFSET ?`,
    [limit, offset],
  )

  if (
    result.success &&
    result.data &&
    countResult.success &&
    countResult.data
  ) {
    const response: AdminListResponse = {
      data: result.data.map(admin => ({
        id: admin.id!,
        name: admin.name,
        email: admin.email,
        role: admin.role,
        status: admin.status,
        img_profile: req.protocol + '://' + req.get('host') + '/uploads/images/admin_users/' + admin.img_profile ,
        last_login: admin.last_login,
        created_at: admin.created_at,
        updated_at: admin.updated_at
      })),
      pagination: {
        total: countResult.data[0].total,
        page,
        limit,
        totalPages: Math.ceil(countResult.data[0].total / limit),
      },
    }
    res.json(response)
  } else {
    res.status(500).json({ error: result.error || countResult.error } as any)
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
    
    const UserData = await executeSingleQuery<AdminUserRow>('SELECT * FROM admin_users WHERE id = ?', [id]);
    if (UserData.success && UserData.data && UserData.data.length > 0) {
      const img_profile_old = UserData.data[0].img_profile;
      if (img_profile_old && img_profile_old !== 'default.png') {
        const img_path = path.join(__dirname, '..', 'uploads', 'images', 'admin_users', img_profile_old);
        if (fs.existsSync(img_path)) {
          fs.unlinkSync(img_path);
        }
      }
      updates.push('img_profile = ?')
      values.push(img_profile)  
    }
  }
  
  if (email !== undefined) {
    updates.push('email = ?')
    values.push(email)
  }
  if (status !== undefined ) {
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
  const AdminData = await executeSingleQuery<AdminUserRow>('SELECT * FROM admin_users WHERE id = ?', [id]);
  if (AdminData.success && AdminData.data && AdminData.data.length > 0) {
    const img_profile = AdminData.data[0].img_profile;
    if (img_profile && img_profile !== 'default.png') {
      const img_path = path.join(__dirname, '..', 'uploads', 'images', 'admin_users', img_profile);
      if (fs.existsSync(img_path)) {
        fs.unlinkSync(img_path);
      }
    }
  }
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

const createUser = asyncHandler(async (req: Request, res: Response) => {
  const {military_id , name , rank , department , active , username , password , phone_number ,img_profile ,city } = req.body;
  const existingUser = await isPoliceUserExist(username);
  if (existingUser) {
    res.status(400).json({ error: 'Police User already exists' })
    return
  }
  const hashedPassword = await bcrypt.hash(password, parseInt(process.env.SALT_PASSWORD || '10'));
  const query = `INSERT INTO police_users (military_id, name, \`rank\`, department, active, username, city, password_hash, phone_number, img_profile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  const result = await executeNonQuery(query, [military_id, name, rank, department, active, username, city, hashedPassword, phone_number, img_profile]);
  if (result.success) {
    res.status(200).json({ message: 'Police User created successfully' })
  } else {
    res.status(500).json({ error: result.error })
  }
})

const getAllUsers = asyncHandler(async (req: Request, res: Response<PoliceUserListResponse>) => {
  const page = parseInt(req.query.page as string) || 1
  const limit = parseInt(req.query.limit as string) || 10
  const offset = (page - 1) * limit

  const countResult = await executeSingleQuery<CountResult>(
    'SELECT COUNT(*) as total FROM police_users'
  )

  const result = await executeQuery<PoliceUserRow>(
    `SELECT id, military_id, name, \`rank\`, department, city, active, username, phone_number, img_profile, last_login, created_at , online, updated_at 
     FROM police_users 
     ORDER BY created_at ASC 
     LIMIT ? OFFSET ?`,
    [limit, offset]
  )

  if (result.success && result.data && countResult.success && countResult.data) {
    const response: PoliceUserListResponse = {
      data: result.data.map(user => ({
        id: user.id,
        badgeNum: user.military_id,
        name: user.name,
        rank: user.rank,
        department: user.department,
        city: user.city,
        active: user.active,
        username: user.username,
        phone_number: user.phone_number,
        img_profile: req.protocol + '://' + req.get('host') + '/uploads/images/police_users/' + user.img_profile,
        last_login: user.last_login,
        online: user.online,
        created_at: user.created_at,
        updated_at: user.updated_at
      })),
      pagination: {
        total: countResult.data[0].total,
        page,
        limit,
        totalPages: Math.ceil(countResult.data[0].total / limit)
      }
    }
    res.json(response)
  } else {
    res.status(500).json({ error: result.error || countResult.error } as any)
  }
})

const getUser = asyncHandler(async (req: Request, res: Response) => {
  const { id } = req.params
  const result = await executeSingleQuery<PoliceUserRow>(
    'SELECT * FROM police_users WHERE id = ?',
    [id],
  )
  if (result.success && result.data && result.data.length > 0) {
    const user = result.data[0]
    const response: PoliceUserResponse = {
      id: user.id,
      badgeNum: user.military_id,
      name: user.name,
      rank: user.rank,
      department: user.department,
      city: user.city,
      active: user.active,
      username: user.username,
      phone_number: user.phone_number,
      img_profile: req.protocol + '://' + req.get('host') + '/uploads/images/police_users/' + user.img_profile,
      last_login: user.last_login,
      online: user.online,  
      created_at: user.created_at,
      updated_at: user.updated_at
    }
    res.json(response)
  } else {
    res.status(404).json({ error: 'Police User not found' } as any)
  }
})

const deleteUser = asyncHandler(async (req: Request, res: Response) => {
  const { id } = req.params
  const UserData = await executeSingleQuery<PoliceUserRow>('SELECT * FROM police_users WHERE id = ?', [id]);
  
  if (UserData.success && UserData.data && UserData.data.length > 0) {
    const img_profile = UserData.data[0].img_profile;
    if (img_profile) {
      const img_path = path.join(__dirname, '..', 'uploads', 'images', 'police_users', img_profile);
      if (fs.existsSync(img_path)) {
        fs.unlinkSync(img_path);
      }
    }
    const result = await executeNonQuery('DELETE FROM police_users WHERE id = ?', [id]);
    if (result.success) {
      res.json({ message: 'Police User deleted successfully' });
    } else {
      res.status(500).json({ error: result.error });
    }
  } else {
    res.status(404).json({ error: 'Police User not found' });
  }
});

const updateUser = asyncHandler(async (req: Request, res: Response) => {
  const { id } = req.params;
  const { military_id, name, rank, department, city, active, username, phone_number, img_profile } = req.body;

  const updates: string[] = [];
  const values: any[] = [];

  if (military_id !== undefined) {
    updates.push('military_id = ?');
    values.push(military_id);
  }
  if (name !== undefined) {
    updates.push('name = ?');
    values.push(name);
  }
  if (rank !== undefined) {
    updates.push('`rank` = ?');
    values.push(rank);
  }
  if (department !== undefined) {
    updates.push('department = ?');
    values.push(department);
  }
  if (city !== undefined) {
    updates.push('city = ?');
    values.push(city);
  }
  if (active !== undefined) {
    updates.push('active = ?');
    values.push(active);
  }
  if (username !== undefined) {
    updates.push('username = ?');
    values.push(username);
  }
  if (phone_number !== undefined) {
    updates.push('phone_number = ?');
    values.push(phone_number);
  }
  if (img_profile !== undefined) {
    const UserData = await executeSingleQuery<PoliceUserRow>('SELECT * FROM police_users WHERE id = ?', [id]);
    if (UserData.success && UserData.data && UserData.data.length > 0) {
      const img_profile_old = UserData.data[0].img_profile;
      if (img_profile_old && img_profile_old !== 'default.png') {
        const img_path = path.join(__dirname, '..', 'uploads', 'images', 'police_users', img_profile_old);
        if (fs.existsSync(img_path)) {
          fs.unlinkSync(img_path);
        }
      }
      updates.push('img_profile = ?');
      values.push(img_profile);
    }
  }

  if (updates.length === 0) {
    res.status(400).json({ error: 'No fields to update' });
    return;
  }

  updates.push('updated_at = ?');
  values.push(new Date());
  values.push(id);

  const query = `UPDATE police_users 
                 SET ${updates.join(', ')}
                 WHERE id = ?`;

  const result = await executeNonQuery(query, values);
  if (result.success) {
    res.json({
      message: 'Police User updated successfully',
      affectedRows: result.affectedRows,
    });
  } else {
    res.status(500).json({ error: result.error });
  }
});

export {
  createAdmin,
  getAdmin,
  getAllAdmins,
  updateAdmin,
  deleteAdmin,
  loginAdmin,
  createUser,
  getAllUsers,
  getUser,
  updateUser,
  deleteUser,
}
