"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.updateAdminValidation = exports.loginAdminValidation = exports.createAdminValidation = void 0;
const express_validator_1 = require("express-validator");
exports.createAdminValidation = [
    (0, express_validator_1.body)('name')
        .notEmpty()
        .withMessage('Name is required')
        .isString()
        .withMessage('Name must be a string')
        .trim()
        .isLength({ min: 2, max: 50 })
        .withMessage('Name must be between 2 and 50 characters'),
    (0, express_validator_1.body)('email')
        .notEmpty()
        .withMessage('Email is required')
        .isEmail()
        .withMessage('Invalid email format')
        .normalizeEmail(),
    (0, express_validator_1.body)('password_hash')
        .notEmpty()
        .withMessage('Password is required')
        .isString()
        .withMessage('Password must be a string')
        .isLength({ min: 6 })
        .withMessage('Password must be at least 6 characters long'),
    (0, express_validator_1.body)('img_profile')
        .optional()
        .isString()
        .withMessage('Profile image must be a string'),
    (0, express_validator_1.body)('role')
        .optional()
        .isString()
        .withMessage('Role must be a string')
        .isIn(['admin', 'super_admin'])
        .withMessage('Role must be either admin or super_admin'),
    (0, express_validator_1.body)('status')
        .optional()
        .isString()
        .withMessage('Status must be a string')
        .isIn(['active', 'inactive'])
        .withMessage('Status must be either active or inactive'),
];
exports.loginAdminValidation = [
    (0, express_validator_1.body)('email')
        .notEmpty()
        .withMessage('Email is required')
        .isEmail()
        .withMessage('Invalid email format')
        .normalizeEmail(),
    (0, express_validator_1.body)('password')
        .notEmpty()
        .withMessage('Password is required')
        .isString()
        .withMessage('Password must be a string')
        .isLength({ min: 6 })
        .withMessage('Password must be at least 6 characters long'),
];
exports.updateAdminValidation = [
    (0, express_validator_1.body)('name')
        .optional()
        .isString()
        .withMessage('Name must be a string')
        .trim()
        .isLength({ min: 2, max: 50 })
        .withMessage('Name must be between 2 and 50 characters'),
    (0, express_validator_1.body)('email')
        .optional()
        .isEmail()
        .withMessage('Invalid email format')
        .normalizeEmail(),
    (0, express_validator_1.body)('img_profile')
        .optional()
        .isString()
        .withMessage('Profile image must be a string'),
    (0, express_validator_1.body)('status')
        .optional()
        .isString()
        .withMessage('Status must be a string')
        .isIn(['active', 'inactive'])
        .withMessage('Status must be either active or inactive'),
    (0, express_validator_1.body)('password')
        .optional()
        .isString()
        .withMessage('Password must be a string')
        .isLength({ min: 6 })
        .withMessage('Password must be at least 6 characters long'),
];
