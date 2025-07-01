"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const admin_middleware_1 = require("../middleware/admin.middleware");
const admin_controller_1 = require("../controller/admin.controller");
const router = (0, express_1.Router)();
/**
 * @route   GET /api/admin/violation/getAllViolations
 * @desc    Get All violations
 * @access  Private ( Admin )
 */
router
    .route('/violations')
    .get(admin_middleware_1.validateAdminToken, admin_controller_1.getAllViolations);
exports.default = router;
