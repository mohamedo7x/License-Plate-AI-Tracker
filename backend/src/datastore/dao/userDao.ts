import { Role, User } from "../../model/User";

export interface UserDao {
    createUser(user: User): Promise<User>;
    findUserById(id: string): Promise<User | null>;
    findUserByUsername(username: string): Promise<User | null>;
    findUsersByRoleId(roleId: string): Promise<User[]>;
    updateUser(id: string, updateData: Partial<User>): Promise<User | null>;
    deleteUser(id: string): Promise<boolean>;
    listAllUsers(): Promise<User[]>;
    findUserByPhoneNumber(phoneNumber: string): Promise<User | null>;
    updateUserLastLogin(id: string): Promise<boolean>;
    listRecentUsers(limit: number): Promise<User[]>;
}

export interface RoleDao {
    createRole(role: Role): Promise<Role>;
    findRoleById(id: string): Promise<Role | null>;
    findRoleByRoleName(roleName: string): Promise<Role | null>;
    updateRole(id: string, updateData: Partial<Role>): Promise<Role | null>;
    deleteRole(id: string): Promise<boolean>;
    listAllRoles(): Promise<Role[]>;
}
