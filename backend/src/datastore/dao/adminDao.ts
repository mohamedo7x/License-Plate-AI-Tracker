import { AdminUser } from '../../model/Admins';

export interface AdminDao {
    createAdmin(admin: AdminUser): Promise<AdminUser>;
    findAdminById(id: string): Promise<AdminUser | null>;
    findAdminByEmail(email: string): Promise<AdminUser | null>;
    updateAdmin(id: string, updateData: Partial<AdminUser>): Promise<AdminUser | null>;
    deleteAdmin(id: string): Promise<boolean>;
    listAllAdmins(): Promise<AdminUser[]>;
}
