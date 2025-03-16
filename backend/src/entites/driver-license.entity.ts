import {
    Entity,
    Column,
    PrimaryColumn,
    ManyToOne,
    OneToMany,
    JoinColumn,
  } from 'typeorm';
  import { Driver } from './driver.entity';
  import { VehicleHistory } from './vehicle-history.entity';
  import { Violation } from './violation.entity';
  
  @Entity('DriverLicenses')
  export class DriverLicense {
    @PrimaryColumn({ type: 'int' })
    id: number;
  
    @Column({ type: 'int' })
    driver_id: number;
  
    @Column({ type: 'varchar', length: 50, unique: true })
    license_number: string;
  
    @Column({ type: 'date' })
    issued_date: Date;
  
    @Column({ type: 'date' })
    expiry_date: Date;
  
    @Column({ type: 'varchar', length: 255, nullable: true })
    status: string;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    updated_at: Date;
  
    @ManyToOne(() => Driver, driver => driver.driverLicenses)
    @JoinColumn({ name: 'driver_id' })
    driver: Driver;
  
    @OneToMany(() => VehicleHistory, vh => vh.driverLicense)
    vehicleHistories: VehicleHistory[];
  
    @OneToMany(() => Violation, violation => violation.driverLicense)
    violations: Violation[];
  }
  