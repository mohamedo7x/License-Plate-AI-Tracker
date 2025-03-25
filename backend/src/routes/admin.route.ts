import { Router } from 'express'
import { createAdmin } from '../controller/admin.controller'
const router = Router()

// @desc       Create new Admin
// @route      POST /admin
// @access     Private
router.route('/').post(createAdmin)

export default router
