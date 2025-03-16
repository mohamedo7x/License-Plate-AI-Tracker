import {
  Entity,
  Column,
  PrimaryColumn,
  ManyToOne,
  OneToMany,
  JoinColumn,
} from 'typeorm';
import { LicensePlate } from './license-plate.entity';
import { User } from './user.entity';
import { Violation } from './violation.entity';

@Entity('Scans')
export class Scan {
  @PrimaryColumn({ type: 'int' })
  id: number;

  @Column({ type: 'int' })
  plate_id: number;

  @Column({ type: 'int' })
  scanned_by: number;

  @Column({ type: 'decimal', precision: 10, scale: 8 })
  latitude: number;

  @Column({ type: 'decimal', precision: 11, scale: 8 })
  longitude: number;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  timestamp: Date;

  @ManyToOne(() => LicensePlate, licensePlate => licensePlate.scans)
  @JoinColumn({ name: 'plate_id' })
  licensePlate: LicensePlate;

  @ManyToOne(() => User, user => user.scans)
  @JoinColumn({ name: 'scanned_by' })
  scanned_byUser: User;

  @OneToMany(() => Violation, violation => violation.scan)
  violations: Violation[];
}
