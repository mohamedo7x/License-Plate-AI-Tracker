import { body } from 'express-validator'

export const createPoliceUserValidation = [
  body('military_id')
    .notEmpty()
    .withMessage('Military ID is required')
    .isString()
    .withMessage('Military ID must be a string')
    .trim()
    .isLength({ min: 1 })
    .withMessage('Military ID must not be empty'),

  body('name')
    .notEmpty()
    .withMessage('Name is required')
    .isString()
    .withMessage('Name must be a string')
    .trim()
    .isLength({ min: 2, max: 50 })
    .withMessage('Name must be between 2 and 50 characters'),

  body('rank')
    .notEmpty()
    .withMessage('Rank is required')
    .isString()
    .withMessage('Rank must be a string')
    .trim()
    .isLength({ min: 1 })
    .withMessage('Rank must not be empty'),

  body('department')
    .notEmpty()
    .withMessage('Department is required')
    .isString()
    .withMessage('Department must be a string')
    .trim()
    .isLength({ min: 1 })
    .withMessage('Department must not be empty'),

  body('active')
    .notEmpty()
    .withMessage('Active status is required')
    .isBoolean()
    .withMessage('Active must be a boolean value'),

  body('username')
    .notEmpty()
    .withMessage('Username is required')
    .isString()
    .withMessage('Username must be a string')
    .trim()
    .isLength({ min: 3, max: 20 })
    .withMessage('Username must be between 3 and 20 characters')
    .matches(/^[a-zA-Z0-9_]+$/)
    .withMessage('Username can only contain letters, numbers, and underscores'),

  body('password')
    .notEmpty()
    .withMessage('Password is required')
    .isString()
    .withMessage('Password must be a string')
    .isLength({ min: 6 })
    .withMessage('Password must be at least 6 characters long'),

  body('city')
    .notEmpty()
    .withMessage('City is required')
    .isString()
    .withMessage('City must be a string')
    .trim()
    .isLength({ min: 1 })
    .withMessage('City must not be empty'),

  body('phone_number')
    .optional()
    .isString()
    .withMessage('Phone number must be a string')
    .trim()
    .matches(/^\+?[0-9]{10,15}$/)
    .withMessage('Phone number must be a valid format'),

  body('img_profile')
    .optional()
    .isString()
    .withMessage('Profile image must be a string'),
]

export const updatePoliceUserValidation = [
  body('military_id')
    .optional()
    .isString()
    .withMessage('Military ID must be a string')
    .trim()
    .isLength({ min: 1 })
    .withMessage('Military ID must not be empty'),

  body('name')
    .optional()
    .isString()
    .withMessage('Name must be a string')
    .trim()
    .isLength({ min: 2, max: 50 })
    .withMessage('Name must be between 2 and 50 characters'),

  body('rank')
    .optional()
    .isString()
    .withMessage('Rank must be a string')
    .trim()
    .isLength({ min: 1 })
    .withMessage('Rank must not be empty'),

  body('department')
    .optional()
    .isString()
    .withMessage('Department must be a string')
    .trim()
    .isLength({ min: 1 })
    .withMessage('Department must not be empty'),

  body('active')
    .optional()
    .isBoolean()
    .withMessage('Active must be a boolean value'),

  body('username')
    .optional()
    .isString()
    .withMessage('Username must be a string')
    .trim()
    .isLength({ min: 3, max: 20 })
    .withMessage('Username must be between 3 and 20 characters')
    .matches(/^[a-zA-Z0-9_]+$/)
    .withMessage('Username can only contain letters, numbers, and underscores'),

  body('city')
    .optional()
    .isString()
    .withMessage('City must be a string')
    .trim()
    .isLength({ min: 1 })
    .withMessage('City must not be empty'),

  body('phone_number')
    .optional()
    .isString()
    .withMessage('Phone number must be a string')
    .trim()
    .matches(/^\+?[0-9]{10,15}$/)
    .withMessage('Phone number must be a valid format'),

  body('img_profile')
    .optional()
    .isString()
    .withMessage('Profile image must be a string'),
]

export const loginPoliceUserValidation = [
  body('username')
    .notEmpty()
    .withMessage('Username is required')
    .isString()
    .withMessage('Username must be a string')
    .trim()
    .isLength({ min: 3, max: 20 })
    .withMessage('Username must be between 3 and 20 characters')
    .matches(/^[a-zA-Z0-9_]+$/)
    .withMessage('Username can only contain letters, numbers, and underscores'),

  body('password')
    .notEmpty()
    .withMessage('Password is required')
    .isString()
    .withMessage('Password must be a string')
    .isLength({ min: 4 })
    .withMessage('Password must be at least 4 characters long'),
]
