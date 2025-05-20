"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.createReportType = exports.getAllReportTypes = exports.changeReportStatus = exports.deleteReport = exports.getSpesificReport = exports.getAllReports = void 0;
const orm_util_1 = require("../utils/orm.util");
const asyncHandler_1 = __importDefault(require("../middleware/asyncHandler"));
const dateFormat_util_1 = require("../utils/dateFormat.util");
const reportScore_1 = require("../utils/reportScore");
exports.getAllReports = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const result = yield (0, orm_util_1.executeQuery)('SELECT rp.id AS report_id , pu.id AS police_id , pu.name AS officer_name, rp.title, rp.description, rp.status, rp.date, rt.name AS report_name, rt.point AS SCORE FROM reports AS rp INNER JOIN police_reports AS pr ON rp.id = pr.report_id INNER JOIN report_type AS rt ON rp.type = rt.id INNER JOIN police_users AS pu ON pu.id = pr.police_id;');
    if (result.success && result.data) {
        const userData = result.data.map((report) => {
            return Object.assign(Object.assign({}, report), { date: (0, dateFormat_util_1.formatDate)(report.date), SCORE: (0, reportScore_1.reportScore)(report.SCORE) });
        });
        res.status(200).json({
            success: true,
            data: userData || [],
        });
    }
}));
exports.getSpesificReport = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const reportId = req.params.id;
    const query = `
  SELECT
      rp.id,
      rp.title,
      rp.description,
      rp.status,
      rp.date,
      rt.name
  FROM
      reports AS rp
  INNER JOIN police_reports AS pr ON rp.id = pr.report_id
  INNER JOIN report_type AS rt ON rp.type = rt.id
  WHERE
      rp.id LIKE ?;
`;
    const result = yield (0, orm_util_1.executeSingleQuery)(query, [`%${reportId}%`]);
    if (result.success && result.data) {
        const userData = result.data.map((report) => {
            return Object.assign(Object.assign({}, report), { date: (0, dateFormat_util_1.formatDate)(report.date) });
        });
        res.status(200).json({
            success: true,
            data: userData || [],
        });
    }
    else {
        res.status(404).json({
            success: false,
            message: 'Sorry, no report found for the provided ID. Please verify the ID and try again.',
        });
    }
}));
exports.deleteReport = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    const reportId = req.params.id;
    const result = yield (0, orm_util_1.executeNonQuery)('DELETE FROM police_reports WHERE id = ?', [reportId]);
    if (result.success && ((_a = result.affectedRows) !== null && _a !== void 0 ? _a : 0) > 0) {
        res.status(200).json({
            success: true,
            message: '✅ The report has been successfully removed.',
        });
    }
    else {
        res.status(404).json({
            success: false,
            message: 'Sorry, no report found for the provided ID. Please verify the ID and try again.',
        });
    }
}));
exports.changeReportStatus = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    const reportId = req.params.id;
    const { status } = req.body;
    const validStatuses = ['complete', 'close', 'processing'];
    if (!validStatuses.includes(status)) {
        res.status(400).json({
            success: false,
            message: `Invalid status value. Allowed values are: ${validStatuses.join(', ')}.`,
        });
        return;
    }
    const result = yield (0, orm_util_1.executeNonQuery)('UPDATE police_reports SET status = ? WHERE id = ?', [status, reportId]);
    if (result.success && ((_a = result.affectedRows) !== null && _a !== void 0 ? _a : 0) > 0) {
        res.status(200).json({
            success: true,
            message: '✅ The report status has been successfully updated.',
        });
    }
    else {
        res.status(404).json({
            success: false,
            message: 'No report found with the specified ID. Status update was not performed.',
        });
    }
}));
exports.getAllReportTypes = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const result = yield (0, orm_util_1.executeQuery)('SELECT * FROM report_type');
    if (result.success && result.data) {
        res.status(200).json({
            success: true,
            data: result.data || [],
        });
    }
    else {
        res.status(404).json({
            success: false,
            message: 'No report types found.',
        });
    }
}));
exports.createReportType = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    const { name, point } = req.body;
    const result = yield (0, orm_util_1.executeNonQuery)('INSERT INTO report_type (name, point) VALUES (?, ?)', [name, point]);
    if (result.success && ((_a = result.affectedRows) !== null && _a !== void 0 ? _a : 0) > 0) {
        res.status(201).json({
            success: true,
            message: '✅ The report type has been successfully created.',
        });
    }
    else {
        res.status(400).json({
            success: false,
            message: '❌ Failed to create the report type.',
        });
    }
}));
