export interface ReportDao {
  createReport(report: Report): Promise<Report>;
  findReportById(id: string): Promise<Report | null>;
  findReportsByOfficerId(officerId: string): Promise<Report[]>;
  listAllReports(): Promise<Report[]>;
  updateReport(id: string, updateData: Partial<Report>): Promise<Report | null>;
  deleteReport(id: string): Promise<boolean>;
  searchReportsByKeyword(keyword: string): Promise<Report[]>;
  countReportsByOfficerId(officerId: string): Promise<number>;
  listRecentReports(limit: number): Promise<Report[]>;
}
