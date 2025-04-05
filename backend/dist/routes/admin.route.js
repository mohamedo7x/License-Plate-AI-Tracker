"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const admin_controller_1 = require("../controller/admin.controller");
const admin_middleware_1 = require("../middleware/admin.middleware");
const multer_middleware_1 = require("../middleware/multer.middleware");
const router = (0, express_1.Router)();
/**
 * @route   POST /api/admin
 * @desc    Create a new admin user
 * @access  Private ( Admin only)
 */
router.route('/').post(admin_middleware_1.validateAdminToken, multer_middleware_1.uploadFile, admin_controller_1.createAdmin);
/**
 * @route   POST /api/admin/login
 * @desc    Login admin user
 * @access  Public
 */
router.route('/login').post(admin_middleware_1.validateLoginBody, admin_controller_1.loginAdmin);
/**
 * @route   GET /api/admin
 * @desc    Get all admin users
 * @access  Private (Admin only)
 */
router.route('/').get(admin_middleware_1.validateAdminToken, admin_controller_1.getAllAdmins);
/**
 * @route   GET /api/admin/:id
 * @desc    Get a single admin user by ID
 * @access  Private (Admin only)
 */
router.route('/:id').get(admin_middleware_1.validateAdminToken, admin_middleware_1.validateAdminId, admin_controller_1.getAdmin);
/**
 * @route   PUT /api/admin/:id
 * @desc    Update an admin user
 * @access  Private (Admin only)
 */
router
    .route('/:id')
    .put(admin_middleware_1.validateAdminToken, admin_middleware_1.validateAdminId, multer_middleware_1.uploadFile, admin_controller_1.updateAdmin);
/**
 * @route   DELETE /api/admin/:id
 * @desc    Delete an admin user
 * @access  Private ( Admin only)
 */
router.route('/:id').delete(admin_middleware_1.validateAdminToken, admin_middleware_1.validateAdminId, admin_controller_1.deleteAdmin);
// User Routes
/**
 * @route   POST /api/admin/user
 * @desc    Create a new user
 * @access  Private ( Admin )
 */
router.route('/police/create-user').post(admin_middleware_1.validateAdminToken, multer_middleware_1.uploadFile, admin_controller_1.createUser);
/**
 * @route   GET /api/admin/users
 * @desc    Get all users
 * @access  Private ( Admin )
 */
router.route('/police/users').get(admin_middleware_1.validateAdminToken, admin_controller_1.getAllUsers);
/**
 * @route   GET /api/admin/user/:id
 * @desc    Get a single user by ID
 * @access  Private ( Admin )
 */
router.route('/police/user/:id').get(admin_middleware_1.validateAdminToken, admin_controller_1.getUser);
/**
 * @route   DELETE /api/admin/user/:id
 * @desc    Delete a user by ID
 * @access  Private ( Admin )
 */
router.route('/police/user/:id').delete(admin_middleware_1.validateAdminToken, admin_controller_1.deleteUser);
/**
 * @route   PUT /api/admin/user/:id
 * @desc    Update a user by ID
 * @access  Private ( Admin )
 */
router.route('/police/user/:id').put(admin_middleware_1.validateAdminToken, multer_middleware_1.uploadFile, admin_controller_1.updateUser);
exports.default = router;
