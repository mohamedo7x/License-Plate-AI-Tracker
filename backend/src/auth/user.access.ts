import jwt from 'jsonwebtoken'
import { IUser } from '../model/default.user'
import { RowDataPacket } from 'mysql2'

const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key'

export const generateUserJWTToken = (user: IUser ): string => {
  const tokenData = {
    id: user.national_id,
  }

  return jwt.sign(tokenData, JWT_SECRET, { expiresIn: '10h' })
}
