import { Router } from 'express'
import {
  createReport,
  login,
  register,
  searchVehcile,
} from '../controller/user.controller'
import {
  userReportValidation,
  validateUser,
  validateUserLogin,
} from '../validation/user.validation'
import { validateRequest } from '../middleware/validateRequest'
import { validateUserToken } from '../auth/user.access'
import { uploadMultiFiles } from '../middleware/multer.middleware'
const route = Router()

route.post('/register', validateUser, validateRequest, register)

route.post('/login', validateUserLogin, validateRequest, login)

route.get('/veh/:id', validateUserToken, searchVehcile)

route.post(
  '/report',
  validateUserToken,
  uploadMultiFiles,
  userReportValidation,
  validateRequest,
  createReport,
)
export default route
