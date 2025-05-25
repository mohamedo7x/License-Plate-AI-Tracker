import { body } from 'express-validator'

export const createAdminValidation = [
  body('name')
    .notEmpty()
    .withMessage('Name is required')
    .isString()
    .withMessage('Name must be a string')
    .trim()
    .isLength({ min: 2, max: 50 })
    .withMessage('Name must be between 2 and 50 characters'),

  body('email')
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email format')
    .normalizeEmail(),

  body('password_hash')
    .notEmpty()
    .withMessage('Password is required')
    .isString()
    .withMessage('Password must be a string')
    .isLength({ min: 6 })
    .withMessage('Password must be at least 6 characters long'),

  body('img_profile')
    .optional()
    .isString()
    .withMessage('Profile image must be a string'),

  body('role')
    .optional()
    .isString()
    .withMessage('Role must be a string')
    .isIn(['admin', 'super_admin'])
    .withMessage('Role must be either admin or super_admin'),

  body('status')
    .optional()
    .isString()
    .withMessage('Status must be a string')
    .isIn(['active', 'inactive'])
    .withMessage('Status must be either active or inactive'),
]

export const loginAdminValidation = [
  body('email')
    .notEmpty()
    .withMessage('Email is required')
    .isEmail()
    .withMessage('Invalid email format')
    .normalizeEmail(),

  body('password')
    .notEmpty()
    .withMessage('Password is required')
    .isString()
    .withMessage('Password must be a string')
    .isLength({ min: 6 })
    .withMessage('Password must be at least 6 characters long'),
]

export const updateAdminValidation = [
  body('name')
    .optional()
    .isString()
    .withMessage('Name must be a string')
    .trim()
    .isLength({ min: 2, max: 50 })
    .withMessage('Name must be between 2 and 50 characters'),

  body('email')
    .optional()
    .isEmail()
    .withMessage('Invalid email format')
    .normalizeEmail(),

  body('img_profile')
    .optional()
    .isString()
    .withMessage('Profile image must be a string'),

  body('status')
    .optional()
    .isString()
    .withMessage('Status must be a string')
    .isIn(['active', 'inactive'])
    .withMessage('Status must be either active or inactive'),
  body('password')
    .optional()
    .isString()
    .withMessage('Password must be a string')
    .isLength({ min: 6 })
    .withMessage('Password must be at least 6 characters long'),
]
