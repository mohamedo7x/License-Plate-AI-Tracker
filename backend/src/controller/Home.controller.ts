import asyncHandler from '../middleware/asyncHandler'
import { Request, Response } from 'express'
import { executeQuery } from '../utils/orm.util'
import { RowDataPacket } from 'mysql2'
import { getMonthKey } from '../utils/DevOperation'

interface HomePage extends RowDataPacket {
  Total_Violations: number
  detected_violation: number
  under_investigation: number
}
export const getStatsitcsOfHome = asyncHandler(
  async (req: Request, res: Response) => {
    const query = `SELECT
  (SELECT COUNT(*) FROM violations WHERE created_at >= NOW() - INTERVAL 30 DAY) AS Total_Violations,
  (SELECT COUNT(*) FROM violations WHERE status = 'paied' AND created_at >= NOW() - INTERVAL 30 DAY) AS detected_violation,
  (SELECT COUNT(*) FROM violations WHERE status = 'under_review' OR status = 'unpaied' AND created_at >= NOW() - INTERVAL 30 DAY) AS under_investigation;
`
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
ORDER BY m.month DESC;`
    const data = await executeQuery<HomePage>(query, [])
    const fethced_trend = await executeQuery(secondQuery, [])
    let detected_violation = 0
    let undetected_violation = 0
    let FetchedData
    let lineChart
    if (fethced_trend && fethced_trend.data) {
      lineChart = fethced_trend.data
    }
    if (data && data.data) {
      FetchedData = data.data[0]
      detected_violation = data.data[0].detected_violation
      undetected_violation = data.data[0].under_investigation
    }
    lineChart = lineChart?.map((el) => {
      return {
        ...el,
        month: getMonthKey(el.month.split('-')[1]),
      }
    })
    res.status(200).json({
      sucess: true,
      statsticsData: FetchedData,
      barData: {}, // Not Completed
      pieDate: { detected_violation, undetected_violation },
      lineChart,
    })
  },
)
