export * from './user.entity';
export * from './role.entity';
export * from './vehicle.entity';
export * from './driver-vehicle.entity';
export * from './driver.entity';
export * from './license-plate.entity';
export * from './scan.entity';
export * from './vehicle-history.entity';
export * from './driver-license.entity';
export * from './violation.entity';
export * from './audit-log.entity';
export * from './notification.entity';
export * from './report.entity';
export * from './admin-user.entity';



import { User } from './user.entity';
import { Role } from './role.entity';
import { Vehicle } from './vehicle.entity';
import { DriverVehicle } from './driver-vehicle.entity';
import { Driver } from './driver.entity';
import { LicensePlate } from './license-plate.entity';
import { Scan } from './scan.entity';
import { VehicleHistory } from './vehicle-history.entity';
import { DriverLicense } from './driver-license.entity';
import { Violation } from './violation.entity';
import { AuditLog } from './audit-log.entity';
import { Notification } from './notification.entity';
import { Report } from './report.entity';
import { AdminUser } from './admin-user.entity';

export const entities = [
  User,
  Role,
  Vehicle,
  DriverVehicle,
  Driver,
  LicensePlate,
  Scan,
  VehicleHistory,
  DriverLicense,
  Violation,
  AuditLog,
  Notification,
  Report,
  AdminUser,
];