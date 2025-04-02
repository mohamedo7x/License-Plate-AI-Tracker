"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const admin_controller_1 = require("../controller/admin.controller");
const admin_middleware_1 = require("../middleware/admin.middleware");
const router = (0, express_1.Router)();
/**
 * @route   POST /api/admin/login
 * @desc    Login admin user
 * @access  Public
 */
router.route('/login').post(admin_middleware_1.validateLoginBody, admin_controller_1.loginAdmin);
/**
 * @route   POST /api/admin
 * @desc    Create a new admin user
 * @access  Private (Super Admin only)
 */
router.route('/').post(admin_middleware_1.validateAdminToken, admin_middleware_1.validateCreateAdminBody, admin_controller_1.createAdmin);
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
    .put(admin_middleware_1.validateAdminToken, admin_middleware_1.validateAdminId, admin_middleware_1.validateUpdateAdminBody, admin_controller_1.updateAdmin);
/**
 * @route   DELETE /api/admin/:id
 * @desc    Delete an admin user
 * @access  Private (Super Admin only)
 */
router.route('/:id').delete(admin_middleware_1.validateAdminToken, admin_middleware_1.validateAdminId, admin_controller_1.deleteAdmin);
exports.default = router;
