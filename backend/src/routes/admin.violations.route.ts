import { Router } from 'express'
import { validateAdminToken } from '../middleware/admin.middleware'
import { getAllViolations, getSpesificViolation, getViolationsType } from '../controller/admin.controller'
const router = Router()

/**
 * @route   GET /api/custome/getAllViolations
 * @desc    Get All violations
 * @access  Private ( Admin )
 */
router
  .route('/violations')
  .get(
    validateAdminToken,
    getAllViolations
  )


/**
 * @route   GET /api/custome/type
 * @desc    Get All violations type
 * @access  Private ( Admin )
 */
router
  .route('/type')
  .get(
    validateAdminToken,
    getViolationsType
  )


  /**
 * @route   GET /api/custome/getSpesific
 * @desc    Get All violations
 * @access  Private ( Admin )
 */
router
  .route('/getSpesific')
  .get(
    validateAdminToken,
    getSpesificViolation
  )

export default router;