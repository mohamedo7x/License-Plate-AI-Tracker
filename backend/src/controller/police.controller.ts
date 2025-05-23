import {
  executeSingleQuery,
  executeNonQuery,
  executeQuery,
} from '../utils/orm.util'
import { Request, Response } from 'express'
import {
  generatePoliceUserJWTToken,
  validatePoliceToken,
} from '../auth/police_user.access'
import { PoliceUser } from '../model/police_user.model'
import asyncHandler from '../middleware/asyncHandler'
import bcrypt from 'bcrypt'
import { getOTP, sendOTP } from '../utils/otp'

export const loginPoliceUser = asyncHandler(
  async (req: Request, res: Response) => {
    try {
      const { username, password } = req.body
      const result = await executeSingleQuery<PoliceUser>(
        'SELECT * FROM police_users WHERE username = ?',
        [username],
      )
      if (!result.success || !result.data || result.data.length === 0) {
        res.status(401).json({ message: 'Invalid username or password' })
        return
      }
      const policeUser = result.data[0]
      const isPasswordValid = await bcrypt.compare(
        password,
        policeUser.password_hash,
      )
      if (!isPasswordValid) {
        res.status(401).json({ message: 'Invalid username or password' })
        return
      }

      const token = generatePoliceUserJWTToken(policeUser)
      await executeNonQuery(
        'UPDATE police_users SET last_login = ? WHERE id = ?',
        [new Date(), policeUser.id],
      )
      const query = 'UPDATE police_users SET online = 1 WHERE id = ?'
      await executeNonQuery(query, [policeUser.id])
      sendOTP(policeUser.phone_number, policeUser.id)
      const otp = await getOTP(policeUser.id)
      res.status(200).json({
        message: 'Police user logged in successfully',
        token,
        user: policeUser,
        sms_otp: otp,
      })
    } catch (error) {
      console.error('Login error:', error)
      res.status(500).json({ message: 'Internal server error' })
    }
  },
)

export const logoutPoliceUser = asyncHandler(
  async (req: Request, res: Response) => {
    try {
      const user = (req as any).user
      const query = 'UPDATE police_users SET online = 0 WHERE id = ?'
      await executeNonQuery(query, [user.id])
      res.status(200).json({
        message: `Police User logged out successfully`,
      })
    } catch (error) {
      console.error('Logout error:', error)
      res.status(500).json({ message: 'Internal server error' })
    }
  },
)

export const getMyDetails = asyncHandler(
  async (req: Request, res: Response) => {
    const user = (req as any).user
    const result = await executeSingleQuery<PoliceUser>(
      'SELECT * FROM police_users WHERE id = ?',
      [user.id],
    )
    if (result.success && result.data && result.data.length > 0) {
      const userData = result.data[0]
      const { password_hash, ...safeUserData } = userData
      res.status(200).json({
        success: true,
        data: safeUserData,
      })
    } else {
      res.status(404).json({
        success: false,
        message: 'User not found',
      })
    }
  },
)
