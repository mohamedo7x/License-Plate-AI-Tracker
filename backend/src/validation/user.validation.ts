import { body } from 'express-validator'

export const validateUser = [
  body('national_id')
    .notEmpty()
    .withMessage('National ID is required.')
    .isLength({ min: 14, max: 14 })
    .withMessage('National ID must be exactly 14 digits.')
    .matches(/^[0-9]{14}$/)
    .withMessage('National ID must contain only numbers.'),

  body('email')
    .notEmpty()
    .withMessage('Email is required.')
    .isEmail()
    .withMessage('Invalid email address.')
    .normalizeEmail(),

  body('password')
    .notEmpty()
    .withMessage('Password is required.')
    .isLength({ min: 5, max: 20 })
    .withMessage('Password must be between 5 and 20 characters.'),
]

export const validateUserLogin = [

  body('email')
    .notEmpty()
    .withMessage('Email is required.')
    .isEmail()
    .withMessage('Invalid email address.')
    .normalizeEmail(),

  body('password')
    .notEmpty()
    .withMessage('Password is required.')
    .isLength({ min: 5, max: 20 })
    .withMessage('Password must be between 5 and 20 characters.'),
]

