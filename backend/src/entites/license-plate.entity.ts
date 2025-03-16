import {
    Entity,
    Column,
    PrimaryColumn,
    ManyToOne,
    OneToMany,
    JoinColumn,
  } from 'typeorm';
  import { Vehicle } from './vehicle.entity';
  import { Scan } from './scan.entity';
  import { VehicleHistory } from './vehicle-history.entity';
  
  @Entity('LicensePlates')
  export class LicensePlate {
    @PrimaryColumn({ type: 'int' })
    id: number;
  
    @Column({ type: 'varchar', length: 20, unique: true })
    plate_number: string;
  
    @Column({ type: 'int' })
    vehicle_id: number;
  
    @Column({ type: 'varchar', length: 50 })
    state: string;
  
    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;
  
    @ManyToOne(() => Vehicle, vehicle => vehicle.licensePlates)
    @JoinColumn({ name: 'vehicle_id' })
    vehicle: Vehicle;
  
    @OneToMany(() => Scan, scan => scan.licensePlate)
    scans: Scan[];
  
    @OneToMany(() => VehicleHistory, vh => vh.licensePlate)
    vehicleHistories: VehicleHistory[];
  }
  