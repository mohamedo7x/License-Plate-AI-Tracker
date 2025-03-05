import { AuditLog } from '../../model/Logs';

export interface AuditLogDao {
  createAuditLog(log: AuditLog): Promise<AuditLog>;
  findAuditLogById(id: string): Promise<AuditLog | null>;
  findAuditLogsByUserId(userId: string): Promise<AuditLog[]>;
  findAuditLogsByAction(action: string): Promise<AuditLog[]>;
  listAllAuditLogs(): Promise<AuditLog[]>;
  deleteAuditLog(id: string): Promise<boolean>;
}
