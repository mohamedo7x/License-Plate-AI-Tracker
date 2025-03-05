export interface User {
  id: string;
  name: string;
  last_login?: Date | null;
  username: string;
  password_hash: string;
  role_id: string;
  phone_number?: string;
  created_at?: Date;
  updated_at?: Date;
}
export interface Role {
  id: string;
  role_name: string;
}
