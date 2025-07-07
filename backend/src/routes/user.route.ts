import { Router } from 'express'
import { login, register, searchVehcile } from '../controller/user.controller'
import { validateUser, validateUserLogin } from '../validation/user.validation'
import { validateRequest } from '../middleware/validateRequest'
import { validateUserToken } from '../auth/user.access'
const route = Router()

route.post('/register', validateUser, validateRequest, register)

route.post('/login',validateUserLogin , validateRequest ,login)

route.get('/veh/:id', validateUserToken ,searchVehcile)
export default route
