import { Router } from 'express'
import { login, register } from '../controller/user.controller'
import { validateUser, validateUserLogin } from '../validation/user.validation'
import { validateRequest } from '../middleware/validateRequest'
const route = Router()

route.post('/register', validateUser, validateRequest, register)

route.post('/login',validateUserLogin , validateRequest ,login)

export default route
