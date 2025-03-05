export enum AdminRole {
  SuperAdmin = 'superadmin',
  Admin = 'admin',
  Moderator = 'moderator',
}

export enum AdminStatus {
  Active = 'active',
  Inactive = 'inactive',
  Suspended = 'suspended',
}

export interface AdminUser {
  id: string;
  name: string;
  email: string;
  password_hash: string;
  role: AdminRole;
  status: AdminStatus;
  last_login?: Date | null;
  created_at?: Date;
  updated_at?: Date;
}
