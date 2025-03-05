import { AuditLogVehicle, Vehicle, VehicleHistory } from '../../model/Vehicle';

export interface VehicleDao {
  createVehicle(vehicle: Vehicle): Promise<Vehicle>;
  findVehicleById(id: string): Promise<Vehicle | null>;
  findVehiclesByManufacturer(manufacturer: string): Promise<Vehicle[]>;
  findVehiclesByModel(model: string): Promise<Vehicle[]>;
  findVehiclesByColor(color: string): Promise<Vehicle[]>;
  findVehiclesByYear(year: number): Promise<Vehicle[]>;
  updateVehicle(id: string, updateData: Partial<Vehicle>): Promise<Vehicle | null>;
  deleteVehicle(id: string): Promise<boolean>;
  listAllVehicles(): Promise<Vehicle[]>;
}

export interface VehicleHistoryDao {
  createVehicleHistory(history: VehicleHistory): Promise<VehicleHistory>;
  findVehicleHistoryById(id: string): Promise<VehicleHistory | null>;
  findVehicleHistoriesByVehicleId(vehicleId: string): Promise<VehicleHistory[]>;
  findVehicleHistoriesByPlateId(plateId: string): Promise<VehicleHistory[]>;
  findVehicleHistoriesByLicenseId(licenseId: string): Promise<VehicleHistory[]>;
  findVehicleHistoriesByViolation(violation: string): Promise<VehicleHistory[]>;
  findVehicleHistoriesByRecordedBy(userId: string): Promise<VehicleHistory[]>;
  listRecentVehicleHistories(limit: number): Promise<VehicleHistory[]>;
  deleteVehicleHistory(id: string): Promise<boolean>;
}

export interface AuditLogDaoVehicle {
  createAuditLog(log: AuditLogVehicle): Promise<AuditLogVehicle>;
  findAuditLogById(id: string): Promise<AuditLogVehicle | null>;
  findAuditLogsByUserId(userId: string): Promise<AuditLogVehicle[]>;
  findAuditLogsByAction(action: string): Promise<AuditLogVehicle[]>;
  findAuditLogsByDateRange(startDate: Date, endDate: Date): Promise<AuditLogVehicle[]>;
  listAllAuditLogs(): Promise<AuditLogVehicle[]>;
  listRecentAuditLogs(limit: number): Promise<AuditLogVehicle[]>;
  deleteAuditLog(id: string): Promise<boolean>;
}
