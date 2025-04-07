import { RowDataPacket } from "mysql2"

export interface PoliceUser extends RowDataPacket {
  username: string
  rank: string
  department: string
  active: boolean
}
