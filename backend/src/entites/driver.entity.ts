import { Entity, Column, PrimaryColumn, OneToMany } from 'typeorm';
import { DriverVehicle } from './driver-vehicle.entity';
import { DriverLicense } from './driver-license.entity';

@Entity('Drivers')
export class Driver {
  @PrimaryColumn({ type: 'int' })
  id: number;

  @Column({ type: 'varchar', length: 100 })
  name: string;

  @Column({ type: 'date' })
  dob: Date;

  @Column({ type: 'date' })
  issued_date: Date;

  @Column({ type: 'date' })
  expiry_date: Date;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  created_at: Date;

  @OneToMany(() => DriverVehicle, driverVehicle => driverVehicle.driver)
  driverVehicles: DriverVehicle[];

  @OneToMany(() => DriverLicense, driverLicense => driverLicense.driver)
  driverLicenses: DriverLicense[];
}
