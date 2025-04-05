import { executeSingleQuery } from '../utils/orm.util'
import { User } from '../model/user.model'
import jwt from 'jsonwebtoken'
import { UnauthorizedError, ForbiddenError } from '../middleware/errorHandler'
import { RowDataPacket } from 'mysql2'

interface UserRow extends RowDataPacket {
  id: number
  role: string
}

const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key'

export async function isPoliceUserExist(username: string): Promise<User | false> {
  try {
    const result = await executeSingleQuery<User>(
      'SELECT * FROM police_users WHERE username = ?',
      [username],
    )
    return result.success && result.data && result.data.length > 0
      ? result.data[0]
      : false
  } catch (error) {
    console.error('Error checking user existence:', error)
    return false
  }
}

export const extractJWTToken = (req: any): string | null => {
  const authHeader = req.headers.authorization
  if (!authHeader) {
    throw new UnauthorizedError(
      'Authorization header is missing. Please provide a valid token.',
    )
  }

  const [bearer, token] = authHeader.split(' ')
  if (bearer !== 'Bearer' || !token) {
    throw new UnauthorizedError(
      'Invalid authorization header format. Expected format: Bearer <token>',
    )
  }

  return token
}

export const validateJWTToken = (token: string): any => {
  try {
    return jwt.verify(token, JWT_SECRET)
  } catch (error) {
    if (error instanceof jwt.TokenExpiredError) {
      throw new UnauthorizedError('Token has expired. Please login again.')
    }
    if (error instanceof jwt.JsonWebTokenError) {
      throw new UnauthorizedError(
        'Invalid token. Please provide a valid authentication token.',
      )
    }
    throw new UnauthorizedError('Failed to verify token. Please try again.')
  }
}

export async function checkUserPrivilege(
  userId: number,
  requiredRoleId: number,
): Promise<boolean> {
  try {
    const result = await executeSingleQuery<User>(
      'SELECT role_id FROM users WHERE id = ?',
      [userId],
    )
    if (!result.success || !result.data || result.data.length === 0)
      return false

    const userRoleId = result.data[0].role_id
    return userRoleId === requiredRoleId
  } catch (error) {
    console.error('Error checking user privilege:', error)
    return false
  }
}

export async function isAdmin(userId: number): Promise<boolean> {
  return checkUserPrivilege(userId, 1)
}

export async function isModerator(userId: number): Promise<boolean> {
  return checkUserPrivilege(userId, 2)
}

export const isUser = async (userId: number): Promise<boolean> => {
  try {
    const query = `
      SELECT r.role 
      FROM Users u
      JOIN Roles r ON u.role_id = r.id
      WHERE u.id = ? AND r.role = 'user'
    `
    const result = await executeSingleQuery<UserRow>(query, [userId])

    if (!result.success) {
      throw new ForbiddenError(
        'Failed to verify user status. Database error occurred.',
      )
    }

    return Boolean(result.data && result.data.length > 0)
  } catch (error) {
    if (error instanceof ForbiddenError) {
      throw error
    }
    throw new ForbiddenError(
      'Unable to verify user privileges. Please try again later.',
    )
  }
}

export const isVehicleUser = async (userId: number): Promise<boolean> => {
  try {
    const query = `
      SELECT r.role 
      FROM Users u
      JOIN Roles r ON u.role_id = r.id
      WHERE u.id = ? AND r.role = 'vehicle_user'
    `
    const result = await executeSingleQuery<UserRow>(query, [userId])

    if (!result.success) {
      throw new ForbiddenError(
        'Failed to verify vehicle user status. Database error occurred.',
      )
    }

    return Boolean(result.data && result.data.length > 0)
  } catch (error) {
    if (error instanceof ForbiddenError) {
      throw error
    }
    throw new ForbiddenError(
      'Unable to verify vehicle user privileges. Please try again later.',
    )
  }
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
