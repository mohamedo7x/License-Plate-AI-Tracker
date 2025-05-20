import { Router } from 'express'
import { getPersonByID } from '../controller/admin.person.controller'
import { PersonValidation } from '../validation/person.validation'
import { validateRequest } from '../middleware/validateRequest'
import { validatePoliceToken } from '../auth/police_user.access'
const router = Router()

/**
 * @route   GET /api/person/admin
 * @desc    get Person Using ID
 * @access  Private ( Admin only)
 **/
router
  .route('/:id')
  .get(validatePoliceToken, PersonValidation, validateRequest, getPersonByID)

export default router
