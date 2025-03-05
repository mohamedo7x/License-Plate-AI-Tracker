export interface Vehicle {
  id: string;
  manufacturer: string;
  model: string;
  color: string;
  year: number;
}

export interface VehicleHistory {
  id: string;
  plate_id: string;
  note?: string;
  recorded_by?: string;
  violation?: string;
  vehicle_id: string;
  license_id?: string;
  created_at?: Date;
}

export interface AuditLogVehicle {
  id: string;
  user_id: string;
  action: string;
  timestamp?: Date;
}
