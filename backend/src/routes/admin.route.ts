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
  validateLoginBody,
} from '../middleware/admin.middleware'
import { uploadFile } from '../middleware/multer.middleware'

const router = Router()


/**
 * @route   POST /api/admin
 * @desc    Create a new admin user
 * @access  Private ( Admin only)
 */
router.route('/').post(validateAdminToken, uploadFile , createAdmin)


/**
 * @route   POST /api/admin/login
 * @desc    Login admin user
 * @access  Public
 */
router.route('/login').post(validateLoginBody, loginAdmin)



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
 * @route   POST /api/admin/user
 * @desc    Create a new user
 * @access  Private ( Admin )
 */
router.route('/police/create-user').post(validateAdminToken, uploadFile , createUser)



/**
 * @route   GET /api/admin/users
 * @desc    Get all users
 * @access  Private ( Admin )
 */
router.route('/police/users').get(validateAdminToken , getAllUsers)


/**
 * @route   GET /api/admin/user/:id
 * @desc    Get a single user by ID
 * @access  Private ( Admin )
 */
router.route('/police/user/:id').get(validateAdminToken, getUser)


/**
 * @route   DELETE /api/admin/user/:id
 * @desc    Delete a user by ID
 * @access  Private ( Admin )
 */
router.route('/police/user/:id').delete(validateAdminToken, deleteUser)


/**
 * @route   PUT /api/admin/user/:id
 * @desc    Update a user by ID
 * @access  Private ( Admin )
 */
router.route('/police/user/:id').put(validateAdminToken, uploadFile , updateUser)



export default router
