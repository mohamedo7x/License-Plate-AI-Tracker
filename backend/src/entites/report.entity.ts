import { Entity, Column, PrimaryColumn, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user.entity';

@Entity('Reports')
export class Report {
  @PrimaryColumn({ type: 'int' })
  id: number;

  @Column({ type: 'int' })
  officer_id: number;

  @Column({ type: 'text' })
  details: string;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  report_date: Date;

  @ManyToOne(() => User, user => user.reports)
  @JoinColumn({ name: 'officer_id' })
  officer: User;
}
