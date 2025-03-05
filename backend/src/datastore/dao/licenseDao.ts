import { DriverLicense, LicenseStatus, LicensePlate } from '../../model/License';

export interface DriverLicenseDao {
  createDriverLicense(driverLicense: DriverLicense): Promise<DriverLicense>;
  findDriverLicenseById(id: string): Promise<DriverLicense | null>;
  findDriverLicensesByDriverId(driverId: string): Promise<DriverLicense[]>;
  findDriverLicenseByLicenseNumber(licenseNumber: string): Promise<DriverLicense | null>;
  updateDriverLicense(
    id: string,
    updateData: Partial<DriverLicense>
  ): Promise<DriverLicense | null>;
  deleteDriverLicense(id: string): Promise<boolean>;
  listAllDriverLicenses(): Promise<DriverLicense[]>;
  listDriverLicensesByStatus(status: LicenseStatus): Promise<DriverLicense[]>;
}

export interface LicensePlateDao {
  createLicensePlate(licensePlate: LicensePlate): Promise<LicensePlate>;
  findLicensePlateById(id: string): Promise<LicensePlate | null>;
  findLicensePlateByPlateNumber(plateNumber: string): Promise<LicensePlate | null>;
  findLicensePlatesByVehicleId(vehicleId: string): Promise<LicensePlate[]>;
  updateLicensePlate(id: string, updateData: Partial<LicensePlate>): Promise<LicensePlate | null>;
  deleteLicensePlate(id: string): Promise<boolean>;
  listAllLicensePlates(): Promise<LicensePlate[]>;
}
