export interface Driver {
    id: number;
    name: string;
    profile_img?: string | null;
    dob: Date;
    issued_date: Date;
    expiry_date: Date;
    created_at?: Date;
  }
  