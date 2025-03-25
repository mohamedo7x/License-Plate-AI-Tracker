import AdminRoute from './admin.route'
import { Router } from 'express'
const route = Router()

route.use(`/admin`, AdminRoute)

export default route
