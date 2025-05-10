import { body } from 'express-validator'

export const createReportValidation = [
  body('title')
    .notEmpty()
    .withMessage('Title of reprots is required')
    .trim()
    .isString()
    .withMessage('Title of reports must be a string')
    .isLength({ min: 5, max: 50 })
    .withMessage('Title of reports must be between 5 and 50 characters'),

  body('type')
    .notEmpty()
    .withMessage('Type of reprots is required')
    .trim()
    .isString()
    .withMessage('Type of reports must be a string')
    .isLength({ min: 5, max: 50 })
    .withMessage('Type of reports must be between 5 and 50 characters'),

  body('description')
    .notEmpty()
    .withMessage('Description of reprots is required')
    .trim()
    .isString()
    .withMessage('Description of reports must be a string')
    .isLength({ min: 10, max: 500 })
    .withMessage(
      'Description of reports must be between 10 and 500 characters',
    ),
]
