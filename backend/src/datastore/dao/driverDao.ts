import { Driver, DriverVehicle } from '../../model/Driver';

export interface DriverDao {
    createDriver(driver: Driver): Promise<Driver>;
    findDriverById(id: string): Promise<Driver | null>;
    findDriverByLicenseNumber(licenseNumber: string): Promise<Driver | null>;
    updateDriver(id: string, updateData: Partial<Driver>): Promise<Driver | null>;
    deleteDriver(id: string): Promise<boolean>;
    listAllDrivers(): Promise<Driver[]>;
}

export interface DriverVehicleDao {
    assignDriverVehicle(driverVehicle: DriverVehicle): Promise<DriverVehicle>;
    findDriverVehiclesByDriverId(driverId: string): Promise<DriverVehicle[]>;
    findDriverVehicleByVehicleId(vehicleId: string): Promise<DriverVehicle | null>;
    unassignDriverVehicle(driverId: string, vehicleId: string): Promise<boolean>;
}
