import { Entity, Column, PrimaryColumn, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user.entity';

@Entity('Notifications')
export class Notification {
  @PrimaryColumn({ type: 'int' })
  id: number;

  @Column({ type: 'int' })
  user_id: number;

  @Column({ type: 'text', nullable: true })
  message: string;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  created_at: Date;

  @ManyToOne(() => User, user => user.notifications)
  @JoinColumn({ name: 'user_id' })
  user: User;
}
