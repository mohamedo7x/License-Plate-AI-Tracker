import { AdminDao } from './dao/adminDao';
import { AuditLogDao } from './dao/audDao';
import { DriverDao, DriverVehicleDao } from './dao/driverDao';
import { DriverLicenseDao, LicensePlateDao } from './dao/licenseDao';
import { NotificationDao } from './dao/notificationDao';
import { ReportDao } from './dao/reportDao';
import { ScanDao } from './dao/scanDao';
import { UserDao, RoleDao } from './dao/userDao';
import { VehicleDao, VehicleHistoryDao, AuditLogDaoVehicle } from './dao/vehicleDao';
import { ViolationDao } from './dao/violationDao';
import { SqlDataStore } from './sql';
export interface DataStore
  extends AdminDao,
    AuditLogDao,
    DriverDao,
    DriverVehicleDao,
    DriverLicenseDao,
    LicensePlateDao,
    NotificationDao,
    ReportDao,
    ScanDao,
    UserDao,
    RoleDao,
    VehicleDao,
    VehicleHistoryDao,
    AuditLogDaoVehicle,
    ViolationDao {}

export let db: any;

export async function initDb() {
  db = await new SqlDataStore().openDb();
}
