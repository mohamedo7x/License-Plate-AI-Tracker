import { Router } from 'express'
import { validateAdminToken } from '../middleware/admin.middleware'
import { createViolationForAdmin, getAllViolations, getSpesificViolation, getViolationsType } from '../controller/admin.controller'
import { createViolationAdmin } from '../validation/admin.validation'
import { validateRequest } from '../middleware/validateRequest'
import { uploadMultiFiles } from '../middleware/multer.middleware'
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
 * @route   POST /api/custome/createViolation
 * @desc    Create a new violation
 * @access  Private (Admin only)
 */
router
  .route('/createViolation')
  .post(
    validateAdminToken,
    uploadMultiFiles,
    createViolationAdmin,
    validateRequest,
    createViolationForAdmin
  )

export default router;