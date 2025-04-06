import AdminRoute from './admin.route'
import { Router } from 'express'
import AuditLogsRoute from './auditlogs.route'
import { validateAdminToken } from '../middleware/admin.middleware'
const route = Router()

route.use(`/admin`, AdminRoute)

route.use(`/auditlogs`, validateAdminToken, AuditLogsRoute)

export default route
