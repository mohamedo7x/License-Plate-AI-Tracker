import { Violation, ViolationStatus } from "../../model/violation";

export interface ViolationDao {
    createViolation(violation: Violation): Promise<Violation>;
    findViolationById(id: string): Promise<Violation | null>;
    findViolationsByScanId(scanId: string): Promise<Violation[]>;
    findViolationsByLicenseId(licenseId: string): Promise<Violation[]>;
    findViolationsByReporterId(userId: string): Promise<Violation[]>;
    findViolationsByStatus(status: ViolationStatus): Promise<Violation[]>;
    findViolationsByType(violationType: string): Promise<Violation[]>;
    updateViolation(id: string, updateData: Partial<Violation>): Promise<Violation | null>;
    deleteViolation(id: string): Promise<boolean>;
    listAllViolations(): Promise<Violation[]>;
    listRecentViolations(limit: number): Promise<Violation[]>;
    countViolationsByStatus(status: ViolationStatus): Promise<number>;
    listStolenVehicleViolations(): Promise<Violation[]>;
}
