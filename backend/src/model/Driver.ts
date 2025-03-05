export interface Driver {
  id: string;
  name: string;
  dob: Date;
  license_number: string;
  issued_date: Date;
  expiry_date: Date;
  created_at?: Date;
}

export interface DriverVehicle {
  id: string;
  driver_id: string;
  vehicle_id: string;
  assigned_date?: Date;
}
