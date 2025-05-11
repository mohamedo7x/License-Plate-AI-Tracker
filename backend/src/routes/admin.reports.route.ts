import { Router } from 'express'
import {
  getAllReports,
  getSpesificReport,
  deleteReport,
  changeReportStatus,
} from '../controller/report.admin.controller'
import { validateAdminToken } from '../middleware/admin.middleware'

const router = Router()

/**
 * @route   GET /api/admin/reports
 * @desc    get all reports
 * @access  Private ( Admin only)
 **/
router.route('/').get(validateAdminToken, getAllReports)

/**
 * @route   GET /api/admin/reports/:id
 * @desc    get spesific report by id
 * @access  Private ( Admin only)
 **/
router.route('/:id').get(validateAdminToken, getSpesificReport)

/**
 * @route   DELETE /api/admin/reports/:id
 * @desc    delete report by id
 * @access  Private ( Admin only)
 **/
router.route('/:id').delete(validateAdminToken, deleteReport)

/**
 * @route   PUT /api/admin/reports/:id
 * @desc    update report by id
 * @access  Private ( Admin only)
 **/
router.route('/:id').put(validateAdminToken, changeReportStatus)
export default router
