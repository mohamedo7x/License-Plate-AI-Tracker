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
exports.getStatsitcsOfHome = void 0;
const asyncHandler_1 = __importDefault(require("../middleware/asyncHandler"));
const orm_util_1 = require("../utils/orm.util");
const DevOperation_1 = require("../utils/DevOperation");
const response_1 = require("../utils/response");
exports.getStatsitcsOfHome = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const query = `SELECT
  (SELECT COUNT(*) FROM violations WHERE created_at >= NOW() - INTERVAL 30 DAY) AS Total_Violations,
  (SELECT COUNT(*) FROM violations WHERE status = 'paied' AND created_at >= NOW() - INTERVAL 30 DAY) AS detected_violation,
  (SELECT COUNT(*) FROM violations WHERE status = 'under_review' OR status = 'unpaied' AND created_at >= NOW() - INTERVAL 30 DAY) AS under_investigation;
`;
    const secondQuery = `WITH last_6_months AS (
  SELECT DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL n MONTH), '%Y-%m') AS month
  FROM (
    SELECT 0 AS n UNION ALL
    SELECT 1 UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5
  ) AS months
),
violation_counts AS (
  SELECT
    DATE_FORMAT(created_at, '%Y-%m') AS month,
    COUNT(*) AS total_violations
  FROM violations
  WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
  GROUP BY DATE_FORMAT(created_at, '%Y-%m')
)
SELECT
  m.month,
  COALESCE(v.total_violations, 0) AS total_violations
FROM last_6_months m
LEFT JOIN violation_counts v ON m.month = v.month
ORDER BY m.month DESC;`;
    const data = yield (0, orm_util_1.executeQuery)(query, []);
    const fethced_trend = yield (0, orm_util_1.executeQuery)(secondQuery, []);
    let detected_violation = 0;
    let undetected_violation = 0;
    let FetchedData;
    let lineChart;
    if (fethced_trend && fethced_trend.data) {
        lineChart = fethced_trend.data;
    }
    if (data && data.data) {
        FetchedData = data.data[0];
        detected_violation = data.data[0].detected_violation;
        undetected_violation = data.data[0].under_investigation;
    }
    lineChart = lineChart === null || lineChart === void 0 ? void 0 : lineChart.map((el) => {
        return Object.assign(Object.assign({}, el), { month: (0, DevOperation_1.getMonthKey)(el.month.split('-')[1]) });
    });
    res.status(200).json({
        sucess: true,
        statsticsData: (0, response_1.HandelStatistics)(FetchedData),
        barData: {}, // Not Completed
        pieDate: [detected_violation, undetected_violation],
        lineChart,
    });
}));
