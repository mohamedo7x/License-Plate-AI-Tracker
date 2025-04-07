import { Router } from 'express'
import { getMyDetails, loginPoliceUser } from '../controller/police.controller'
import { loginPoliceUserValidation } from '../validation/police.validation'
import { validateRequest } from '../middleware/validateRequest'
import { validatePoliceToken } from '../auth/police_user.access'
const router = Router()

/**
 * @route   POST /api/police/login
 * @desc    Login for police user
 * @access  Public
 */
router.route('/login').post(loginPoliceUserValidation, validateRequest, loginPoliceUser)



/**
 * @route   GET /api/police/my-details
 * @desc    Get my details
 * @access  Private
 */
router.route('/my-details').get(validatePoliceToken, getMyDetails)

export default router
