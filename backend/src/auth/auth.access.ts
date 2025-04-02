import { getConnection } from '../database/Database'
import { User } from '../model/user.model'
import { Request } from 'express'
import jwt from 'jsonwebtoken'

const JWT_SECRET = process.env.JWT_SECRET || ''

export async function isUserExist(username: string): Promise<User | false> {
  try {
    const db = await getConnection()
    const [rows] = await db.query('SELECT * FROM users WHERE username = ?', [
      username,
    ])
    const users = rows as User[]
    return users.length > 0 ? users[0] : false
  } catch (error) {
    console.error('Error checking user existence:', error)
    return false
  }
}

export function extractJWTToken(req: Request): string | null {
  const authHeader = req.headers.authorization
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return null
  }
  return authHeader.split(' ')[1]
}

export function validateJWTToken(token: string): any {
  try {
    return jwt.verify(token, JWT_SECRET)
  } catch (error) {
    return null
  }
}

export async function checkUserPrivilege(
  userId: number,
  requiredRoleId: number,
): Promise<boolean> {
  try {
    const db = await getConnection()
    const [rows] = await db.query('SELECT role_id FROM users WHERE id = ?', [
      userId,
    ])
    const users = rows as User[]
    if (users.length === 0) return false

    const userRoleId = users[0].role_id
    return userRoleId === requiredRoleId
  } catch (error) {
    console.error('Error checking user privilege:', error)
    return false
  }
}

export async function isAdmin(userId: number): Promise<boolean> {
  return checkUserPrivilege(userId, 1) // Assuming 1 is admin role_id
}

export async function isModerator(userId: number): Promise<boolean> {
  return checkUserPrivilege(userId, 2) // Assuming 2 is moderator role_id
}

export async function isUser(userId: number): Promise<boolean> {
  return checkUserPrivilege(userId, 3) // Assuming 3 is user role_id
}

export function generateJWTToken(user: User): string {
  return jwt.sign(
    {
      id: user.id,
      username: user.username,
      role_id: user.role_id,
    },
    JWT_SECRET,
    { expiresIn: '24h' },
  )
}
