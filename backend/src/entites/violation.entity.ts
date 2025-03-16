import {
    Entity,
    Column,
    PrimaryColumn,
    ManyToOne,
    OneToMany,
    JoinColumn,
  } from 'typeorm';
  import { Scan } from './scan.entity';
  import { User } from './user.entity';
  import { DriverLicense } from './driver-license.entity';
  import { VehicleHistory } from './vehicle-history.entity';
  
  @Entity('Violations')
  export class Violation {
    @PrimaryColumn({ type: 'int' })
    id: number;
  
    @Column({ type: 'int' })
    scan_id: number;
  
    @Column({ type: 'varchar', length: 100 })
    violation_type: string;
  
    @Column({ type: 'decimal', precision: 10, scale: 2 })
    penalty_amount: number;
  
    @Column({ type: 'varchar', length: 255, nullable: true })
    status: string;
  
    @Column({ type: 'boolean', default: false })
    is_stolen: boolean;
  
    @Column({ type: 'int' })
    reported_by: number;
  
    @Column({ type: 'int', nullable: true })
    license_id: number;
  
    @Column({ type: 'text', nullable: true })
    notes: string;
  
    @Column({ type: 'varchar', length: 255, nullable: true })
    evidence_url: string;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    updated_at: Date;
  
    @ManyToOne(() => Scan, scan => scan.violations)
    @JoinColumn({ name: 'scan_id' })
    scan: Scan;
  
    @ManyToOne(() => User)
    @JoinColumn({ name: 'reported_by' })
    reportedBy: User;
  
    @ManyToOne(() => DriverLicense, driverLicense => driverLicense.violations, { nullable: true })
    @JoinColumn({ name: 'license_id' })
    driverLicense: DriverLicense;
  
    @OneToMany(() => VehicleHistory, vh => vh.violationDetail)
    vehicleHistories: VehicleHistory[];
  }
  