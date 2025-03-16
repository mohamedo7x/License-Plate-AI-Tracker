import { Entity, Column, PrimaryColumn, OneToMany } from 'typeorm';
import { User } from './user.entity';

@Entity('Roles')
export class Role {
  @PrimaryColumn({ type: 'int' })
  id: number;

  @Column({ type: 'varchar', length: 50, unique: true })
  role_name: string;

  @OneToMany(() => User, user => user.role)
  users: User[];
}
