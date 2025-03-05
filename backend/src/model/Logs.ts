export interface AuditLog {
  id: string;
  user_id: string;
  action: string;
  timestamp?: Date;
}
