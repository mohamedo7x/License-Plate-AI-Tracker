import { Router } from 'express'
import { validateAdminToken } from '../middleware/admin.middleware'
import { validateCreateVehicleBody } from '../middleware/vehicle.middleware'
import { createVehicle } from '../controller/vehicle.controller'

const router = Router()

/**
 * @route   POST /api/vehicle/
 * @desc    create vehicle
 * @access  Private [Admin]
 */
router.post('/', validateAdminToken, validateCreateVehicleBody, createVehicle)

export default router
