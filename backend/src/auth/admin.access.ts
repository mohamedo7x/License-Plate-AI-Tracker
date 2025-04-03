import { executeSingleQuery } from '../utils/query.util'
import { AdminUser } from '../model/admin_user.model'
import { Request } from 'express'
import jwt from 'jsonwebtoken'
import { RowDataPacket } from 'mysql2'
import dotenv from 'dotenv';

dotenv.config();

const JWT_SECRET = process.env.JWT_SECRET || "";
console.log(JWT_SECRET);
interface AdminUserRow extends AdminUser, RowDataPacket {}

export async function isAdminExist(email: string): Promise<AdminUser | false> {
  try {
    const result = await executeSingleQuery<AdminUserRow>(
      'SELECT * FROM admin_users WHERE email = ?',
      [email],
    )
    return result.success && result.data && result.data.length > 0
      ? result.data[0]
      : false
  } catch (error) {
    console.error('Error checking admin existence:', error)
    return false
  }
}

export function extractAdminJWTToken(req: Request): string | null {
  const authHeader = req.headers.authorization
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return null
  }
  return authHeader.split(' ')[1]
}

export function validateAdminJWTToken(token: string): any {
  try {
    return jwt.verify(token, JWT_SECRET)
  } catch (error) {
    return null
  }
}

export async function checkAdminPrivilege(
  adminId: number,
  requiredRole: string,
): Promise<boolean> {
  try {
    const result = await executeSingleQuery<AdminUserRow>(
      'SELECT role FROM admin_users WHERE id = ?',
      [adminId],
    )
    if (!result.success || !result.data || result.data.length === 0)
      return false

    const adminRole = result.data[0].role
    return adminRole === requiredRole
  } catch (error) {
    console.error('Error checking admin privilege:', error)
    return false
  }
}

export async function isSuperAdmin(adminId: number): Promise<boolean> {
  return checkAdminPrivilege(adminId, 'superadmin')
}

export async function isAdmin(adminId: number): Promise<boolean> {
  return checkAdminPrivilege(adminId, 'admin')
}

export function generateAdminJWTToken(admin: AdminUser): string {
  return jwt.sign(
    {
      id: admin.id,
      email: admin.email,
      role: admin.role,
    },
    JWT_SECRET,
    { expiresIn: '24h' },
  )
}
