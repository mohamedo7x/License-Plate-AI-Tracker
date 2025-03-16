import { Entity, Column, PrimaryColumn, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user.entity';

@Entity('AuditLogs')
export class AuditLog {
  @PrimaryColumn({ type: 'int' })
  id: number;

  @Column({ type: 'int' })
  user_id: number;

  @Column({ type: 'text' })
  action: string;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  timestamp: Date;

  @ManyToOne(() => User, user => user.auditLogs)
  @JoinColumn({ name: 'user_id' })
  user: User;
}
