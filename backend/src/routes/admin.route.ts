import { Router } from 'express'
import {
  createAdmin,
  getAdmin,
  getAllAdmins,
  updateAdmin,
  deleteAdmin,
  loginAdmin,
  createUser,
  getAllUsers,
  getUser,
  deleteUser,
  updateUser,
} from '../controller/admin.controller'
import {
  validateAdminToken,
  validateAdminId,
} from '../middleware/admin.middleware'
import { uploadFile } from '../middleware/multer.middleware'
import {
  createAdminValidation,
  loginAdminValidation,
  updateAdminValidation,
} from '../validation/admin.validation'
import {
  createPoliceUserValidation,
  updatePoliceUserValidation,
} from '../validation/police.validation'
import { validateRequest } from '../middleware/validateRequest'

const router = Router()

/**
 * @route   POST /api/admin
 * @desc    Create a new admin user
 * @access  Private ( Admin only)
 */
router
  .route('/')
  .post(
    validateAdminToken,
    uploadFile,
    createAdminValidation,
    validateRequest,
    createAdmin,
  )

/**
 * @route   POST /api/admin/login
 * @desc    Login admin user
 * @access  Public
 */
router.route('/login').post(loginAdminValidation, validateRequest, loginAdmin)

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
    uploadFile,
    updateAdminValidation,
    validateRequest,
    updateAdmin,
  )

/**
 * @route   DELETE /api/admin/:id
 * @desc    Delete an admin user
 * @access  Private ( Admin only)
 */
router.route('/:id').delete(validateAdminToken, validateAdminId, deleteAdmin)

// User Routes

/**
 * @route   POST /api/admin/police/create-user
 * @desc    Create a new police user
 * @access  Private ( Admin )
 */
router
  .route('/police/create-user')
  .post(
    validateAdminToken,
    uploadFile,
    createPoliceUserValidation,
    validateRequest,
    createUser,
  )

/**
 * @route   GET /api/admin/police/users
 * @desc    Get all police users
 * @access  Private ( Admin )
 */
router.route('/police/users').get(validateAdminToken, getAllUsers)

/**
 * @route   GET /api/admin/police/user/:id
 * @desc    Get a single police user by ID
 * @access  Private ( Admin )
 */
router.route('/police/user/:id').get(validateAdminToken, getUser)

/**
 * @route   DELETE /api/admin/police/user/:id
 * @desc    Delete a police user by ID
 * @access  Private ( Admin )
 */
router.route('/police/user/:id').delete(validateAdminToken, deleteUser)

/**
 * @route   PUT /api/admin/police/user/:id
 * @desc    Update a police user by ID
 * @access  Private ( Admin )
 */
router
  .route('/police/user/:id')
  .put(
    validateAdminToken,
    uploadFile,
    updatePoliceUserValidation,
    validateRequest,
    updateUser,
  )

export default router
