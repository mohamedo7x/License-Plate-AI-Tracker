import {
    Entity,
    Column,
    PrimaryColumn,
    ManyToOne,
    OneToMany,
    JoinColumn,
  } from 'typeorm';
  import { Role } from './role.entity';
  import { Scan } from './scan.entity';
  import { AuditLog } from './audit-log.entity';
  import { Notification } from './notification.entity';
  import { Report } from './report.entity';
  
  @Entity('Users')
  export class User {
    @PrimaryColumn({ type: 'varchar', length: 255 })
    id: string;
  
    @Column({ type: 'varchar', length: 100 })
    name: string;
  
    @Column({ type: 'timestamp', nullable: true, default: null })
    last_login: Date;
  
    @Column({ type: 'boolean', nullable: true })
    active: boolean;
  
    @Column({ type: 'varchar', length: 100, unique: true })
    username: string;
  
    @Column({ type: 'varchar', length: 255 })
    password_hash: string;
  
    @Column({ type: 'int' })
    role_id: number;
  
    @ManyToOne(() => Role, role => role.users)
    @JoinColumn({ name: 'role_id' })
    role: Role;
  
    @Column({ type: 'varchar', length: 50, nullable: true })
    phone_number: string;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    updated_at: Date;
  
    @OneToMany(() => Scan, scan => scan.scanned_byUser)
    scans: Scan[];
  
    @OneToMany(() => AuditLog, auditLog => auditLog.user)
    auditLogs: AuditLog[];
  
    @OneToMany(() => Notification, notification => notification.user)
    notifications: Notification[];
  
    @OneToMany(() => Report, report => report.officer)
    reports: Report[];
  }
  