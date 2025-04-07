import AdminRoute from './admin.route'
import { Router } from 'express'
import AuditLogsRoute from './auditlogs.route'
import { validateAdminToken } from '../middleware/admin.middleware'
import ReportRoute from './report.route'
import PoliceRoute from './police.route'
const route = Router()
route.use(`/admin`, AdminRoute)
route.use(`/auditlogs`, validateAdminToken, AuditLogsRoute)

route.use(`/police`, PoliceRoute)
route.use(`/report`, ReportRoute)

export default route
