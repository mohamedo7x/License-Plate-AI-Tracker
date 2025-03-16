import {
    Entity,
    Column,
    PrimaryColumn,
    ManyToOne,
    JoinColumn,
  } from 'typeorm';
  import { Driver } from './driver.entity';
  import { Vehicle } from './vehicle.entity';
  
  @Entity('DriverVehicles')
  export class DriverVehicle {
    @PrimaryColumn({ type: 'int' })
    id: number;
  
    @Column({ type: 'int' })
    driver_id: number;
  
    @Column({ type: 'int' })
    vehicle_id: number;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    assigned_date: Date;
  
    @ManyToOne(() => Driver, driver => driver.driverVehicles)
    @JoinColumn({ name: 'driver_id' })
    driver: Driver;
  
    @ManyToOne(() => Vehicle, vehicle => vehicle.driverVehicles)
    @JoinColumn({ name: 'vehicle_id' })
    vehicle: Vehicle;
  }
  