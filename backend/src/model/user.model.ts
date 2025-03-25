export interface User {
  id: number
  name: string
  last_login?: Date | null
  active?: boolean
  username: string
  password_hash: string
  role_id: number
  phone_number?: string | null
  img_profile?: string | null
  created_at?: Date
  updated_at?: Date
}
