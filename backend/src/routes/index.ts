import AdminRoute from './admin.route'
import VehicleRoute from './vehicle.route'
import { Router } from 'express'
const route = Router()

route.use(`/admin`, AdminRoute)
route.use(`/vehicle`, VehicleRoute)

export default route
