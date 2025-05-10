import { Router } from 'express'
import { validatePoliceToken } from '../auth/police_user.access'
import { Request, Response } from 'express'
const router = Router()

/**
 * @route   POST /api/report
 * @desc    Create a new report
 * @access  Police User only
 */
// router.route('/').post(validatePoliceToken, createReport)
router.route('/').post(validatePoliceToken, (req: Request, res: Response) => {
  res.status(200).json({ message: 'Report created successfully' })
})

export default router
