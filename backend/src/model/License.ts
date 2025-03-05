export enum LicenseStatus {
  Valid = 'Valid',
  Expired = 'Expired',
  Suspended = 'Suspended',
  Revoked = 'Revoked',
}

export interface DriverLicense {
  id: string;
  driver_id: string;
  license_number: string;
  issued_date: Date;
  expiry_date: Date;
  status?: LicenseStatus;
  created_at?: Date;
  updated_at?: Date;
}

export interface LicensePlate {
  id: string;
  plate_number: string;
  vehicle_id: string;
  state: string;
  created_at?: Date;
}
