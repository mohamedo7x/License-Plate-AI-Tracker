export interface NotificationDao {
  createNotification(notification: Notification): Promise<Notification>;
  findNotificationById(id: string): Promise<Notification | null>;
  findNotificationsByUserId(userId: string): Promise<Notification[]>;
  listAllNotifications(): Promise<Notification[]>;
  deleteNotification(id: string): Promise<boolean>;
  markNotificationAsRead(id: string): Promise<boolean>;
  markAllNotificationsAsReadByUser(userId: string): Promise<boolean>;
  deleteAllNotificationsByUser(userId: string): Promise<boolean>;
  listUnreadNotificationsByUser(userId: string): Promise<Notification[]>;
  findNotificationsByDateRange(startDate: Date, endDate: Date): Promise<Notification[]>;
}
