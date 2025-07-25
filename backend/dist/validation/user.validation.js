"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.validateUserObjection = exports.userReportValidation = exports.validateUserLogin = exports.validateUser = void 0;
const express_validator_1 = require("express-validator");
exports.validateUser = [
    (0, express_validator_1.body)('national_id')
        .notEmpty()
        .withMessage('National ID is required.')
        .isLength({ min: 14, max: 14 })
        .withMessage('National ID must be exactly 14 digits.')
        .matches(/^[0-9]{14}$/)
        .withMessage('National ID must contain only numbers.'),
    (0, express_validator_1.body)('email')
        .notEmpty()
        .withMessage('Email is required.')
        .isEmail()
        .withMessage('Invalid email address.')
        .normalizeEmail(),
    (0, express_validator_1.body)('password')
        .notEmpty()
        .withMessage('Password is required.')
        .isLength({ min: 5, max: 20 })
        .withMessage('Password must be between 5 and 20 characters.'),
];
exports.validateUserLogin = [
    (0, express_validator_1.body)('email')
        .notEmpty()
        .withMessage('Email is required.')
        .isEmail()
        .withMessage('Invalid email address.')
        .normalizeEmail(),
    (0, express_validator_1.body)('password')
        .notEmpty()
        .withMessage('Password is required.')
        .isLength({ min: 5, max: 20 })
        .withMessage('Password must be between 5 and 20 characters.'),
];
exports.userReportValidation = [
    (0, express_validator_1.body)('name')
        .trim()
        .notEmpty()
        .withMessage('Name is required.')
        .isLength({ max: 100 })
        .withMessage('Name must be at most 100 characters.'),
    (0, express_validator_1.body)('phone').trim().notEmpty().withMessage('Phone is required.'),
    (0, express_validator_1.body)('address')
        .trim()
        .notEmpty()
        .withMessage('Address is required.')
        .isLength({ max: 255 })
        .withMessage('Address must be at most 255 characters.'),
    (0, express_validator_1.body)('date')
        .trim()
        .notEmpty()
        .withMessage('Date is required.')
        .isISO8601()
        .withMessage('Date must be in a valid ISO 8601 format (e.g. YYYY-MM-DD).'),
    (0, express_validator_1.body)('vehcile_types')
        .trim()
        .notEmpty()
        .withMessage('Vehicle types are required.')
        .isLength({ max: 300 })
        .withMessage('Vehicle types must be at most 300 characters.'),
    (0, express_validator_1.body)('description').trim().notEmpty().withMessage('Description is required.'),
    (0, express_validator_1.body)('attachment')
        .optional()
        .isString()
        .withMessage('Attachment must be a string'),
];
exports.validateUserObjection = [
    (0, express_validator_1.body)('report_id')
        .isNumeric()
        .withMessage('report_id must contain only numbers'),
    (0, express_validator_1.body)('description')
        .isString()
        .withMessage('description must be a string')
        .notEmpty()
        .withMessage('description is required'),
];
