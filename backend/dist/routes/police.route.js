"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const police_controller_1 = require("../controller/police.controller");
const police_validation_1 = require("../validation/police.validation");
const validateRequest_1 = require("../middleware/validateRequest");
const police_user_access_1 = require("../auth/police_user.access");
const router = (0, express_1.Router)();
/**
 * @route   POST /api/police/login
 * @desc    Login for police user
 * @access  Public
 */
router.route('/login').post(police_validation_1.loginPoliceUserValidation, validateRequest_1.validateRequest, police_controller_1.loginPoliceUser);
/**
 * @route   GET /api/police/my-details
 * @desc    Get my details
 * @access  Private
 */
router.route('/my-details').get(police_user_access_1.validatePoliceToken, police_controller_1.getMyDetails);
exports.default = router;
