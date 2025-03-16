import { Entity, Column, PrimaryColumn, OneToMany } from 'typeorm';
import { LicensePlate } from './license-plate.entity';
import { DriverVehicle } from './driver-vehicle.entity';

@Entity('Vehicles')
export class Vehicle {
  @PrimaryColumn({ type: 'int' })
  id: number;

  @Column({ type: 'varchar', length: 50 })
  Manufacturer: string;

  @Column({ type: 'varchar', length: 50 })
  model: string;

  @Column({ type: 'varchar', length: 50 })
  color: string;

  @Column({ type: 'int' })
  year: number;

  @OneToMany(() => LicensePlate, licensePlate => licensePlate.vehicle)
  licensePlates: LicensePlate[];

  @OneToMany(() => DriverVehicle, driverVehicle => driverVehicle.vehicle)
  driverVehicles: DriverVehicle[];
}
