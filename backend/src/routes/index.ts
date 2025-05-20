import AdminRoute from './admin.route'
import { Router } from 'express'
import AuditLogsRoute from './auditlogs.route'
import { validateAdminToken } from '../middleware/admin.middleware'
import PoliceRoute from './police.route'
import admiReports from './admin.reports.route'
import adminPersonRoute from './admin.peron.route'
const route = Router()

route.use(`/admin`, AdminRoute)
route.use(`/reports`, admiReports)

route.use(`/auditlogs`, validateAdminToken, AuditLogsRoute)

route.use(`/police`, PoliceRoute)

route.use('/person/admin', adminPersonRoute)

route.use('/person/police', adminPersonRoute)
export default route
