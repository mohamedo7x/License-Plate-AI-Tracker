export interface DriverLicense {
    id: number;
    driver_id: number;
    license_number: string;
    issued_date: Date;
    expiry_date: Date; 
    status?: string | null;
    created_at?: Date;
    updated_at?: Date;
  }
  