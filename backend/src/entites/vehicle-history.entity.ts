import {
    Entity,
    Column,
    PrimaryColumn,
    ManyToOne,
    JoinColumn,
  } from 'typeorm';
  import { LicensePlate } from './license-plate.entity';
  import { User } from './user.entity';
  import { Violation } from './violation.entity';
  import { DriverLicense } from './driver-license.entity';
  
  @Entity('VehicleHistory')
  export class VehicleHistory {
    @PrimaryColumn({ type: 'int' })
    id: number;
  
    @Column({ type: 'int' })
    plate_id: number;
  
    @Column({ type: 'text', nullable: true })
    note: string;
  
    @Column({ type: 'int', nullable: true })
    recorded_by: number;
  
    @Column({ type: 'int', nullable: true })
    violation: number;
  
    @Column({ type: 'int', nullable: true })
    license_id: number;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;
  
    @ManyToOne(() => LicensePlate, licensePlate => licensePlate.vehicleHistories)
    @JoinColumn({ name: 'plate_id' })
    licensePlate: LicensePlate;
  
    @ManyToOne(() => User, { nullable: true })
    @JoinColumn({ name: 'recorded_by' })
    recordedBy: User;
  
    @ManyToOne(() => Violation, { nullable: true })
    @JoinColumn({ name: 'violation' })
    violationDetail: Violation;
  
    @ManyToOne(() => DriverLicense, { nullable: true })
    @JoinColumn({ name: 'license_id' })
    driverLicense: DriverLicense;
  }
  