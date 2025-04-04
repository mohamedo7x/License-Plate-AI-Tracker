import { Router } from 'express'
import {
  createAdmin,
  getAdmin,
  getAllAdmins,
  updateAdmin,
  deleteAdmin,
  loginAdmin,
  createUser,
} from '../controller/admin.controller'
import {
  validateAdminToken,
  validateCreateAdminBody,
  validateUpdateAdminBody,
  validateAdminId,
  validateLoginBody,
} from '../middleware/admin.middleware'

const router = Router()

/**
 * @route   POST /api/admin/login
 * @desc    Login admin user
 * @access  Public
 */
router.route('/login').post(validateLoginBody, loginAdmin)

/**
 * @route   POST /api/admin
 * @desc    Create a new admin user
 * @access  Private (Super Admin only)
 */
router.route('/').post(validateAdminToken, validateCreateAdminBody, createAdmin)

/**
 * @route   GET /api/admin
 * @desc    Get all admin users
 * @access  Private (Admin only)
 */
router.route('/').get(validateAdminToken, getAllAdmins)

/**
 * @route   GET /api/admin/:id
 * @desc    Get a single admin user by ID
 * @access  Private (Admin only)
 */
router.route('/:id').get(validateAdminToken, validateAdminId, getAdmin)

/**
 * @route   PUT /api/admin/:id
 * @desc    Update an admin user
 * @access  Private (Admin only)
 */
router
  .route('/:id')
  .put(
    validateAdminToken,
    validateAdminId,
    validateUpdateAdminBody,
    updateAdmin,
  )

/**
 * @route   DELETE /api/admin/:id
 * @desc    Delete an admin user
 * @access  Private (Super Admin only)
 */
router.route('/:id').delete(validateAdminToken, validateAdminId, deleteAdmin)


/**
 * @route   POST /api/admin/user
 * @desc    Create a new user
 * @access  Private (Super Admin only)
 */
router.route('/create-user').post(validateAdminToken, createUser);



export default router
