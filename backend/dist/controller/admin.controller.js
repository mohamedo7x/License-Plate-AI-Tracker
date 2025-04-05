"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteUser = exports.updateUser = exports.getUser = exports.getAllUsers = exports.createUser = exports.loginAdmin = exports.deleteAdmin = exports.updateAdmin = exports.getAllAdmins = exports.getAdmin = exports.createAdmin = void 0;
const asyncHandler_1 = __importDefault(require("../middleware/asyncHandler"));
const orm_util_1 = require("../utils/orm.util");
const bcrypt_1 = __importDefault(require("bcrypt"));
const admin_access_1 = require("../auth/admin.access");
const user_access_1 = require("../auth/user.access");
const path = __importStar(require("path"));
const fs = __importStar(require("fs"));
const createAdmin = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { name, img_profile, email, password_hash } = req.body;
    const hashedPassword = yield bcrypt_1.default.hash(password_hash || '', parseInt(process.env.SALT_PASSWORD || '10'));
    const query = `INSERT INTO admin_users (name, img_profile, email, password_hash, role, status, created_at) 
                   VALUES (?, ?, ?, ?, ?, ?, ?)`;
    const values = [
        name,
        img_profile || 'default.png',
        email,
        hashedPassword,
        'admin',
        'active',
        new Date(),
    ];
    const result = yield (0, orm_util_1.executeNonQuery)(query, values);
    if (result.success) {
        res.status(201).json({
            message: 'Admin created successfully',
            affectedRows: result.affectedRows,
        });
    }
    else {
        res.status(500).json({ error: result.error });
    }
}));
exports.createAdmin = createAdmin;
const getAdmin = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const result = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM admin_users WHERE id = ?', [id]);
    if (result.success && result.data && result.data.length > 0) {
        const admin = result.data[0];
        const response = {
            id: admin.id,
            name: admin.name,
            email: admin.email,
            role: admin.role,
            status: admin.status,
            img_profile: (req.protocol + '://' + req.get('host') + '/uploads/images/admin_users/' + admin.img_profile),
            last_login: admin.last_login,
            created_at: admin.created_at,
            updated_at: admin.updated_at
        };
        res.json(response);
    }
    else {
        res.status(404).json({ error: 'Admin not found' });
    }
}));
exports.getAdmin = getAdmin;
const getAllAdmins = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const offset = (page - 1) * limit;
    const countResult = yield (0, orm_util_1.executeSingleQuery)('SELECT COUNT(*) as total FROM admin_users');
    const result = yield (0, orm_util_1.executeQuery)(`SELECT id, name, email, role, status, img_profile, last_login, created_at, updated_at 
     FROM admin_users 
     ORDER BY created_at  
     LIMIT ? OFFSET ?`, [limit, offset]);
    if (result.success &&
        result.data &&
        countResult.success &&
        countResult.data) {
        const response = {
            data: result.data.map(admin => ({
                id: admin.id,
                name: admin.name,
                email: admin.email,
                role: admin.role,
                status: admin.status,
                img_profile: req.protocol + '://' + req.get('host') + '/uploads/images/admin_users/' + admin.img_profile,
                last_login: admin.last_login,
                created_at: admin.created_at,
                updated_at: admin.updated_at
            })),
            pagination: {
                total: countResult.data[0].total,
                page,
                limit,
                totalPages: Math.ceil(countResult.data[0].total / limit),
            },
        };
        res.json(response);
    }
    else {
        res.status(500).json({ error: result.error || countResult.error });
    }
}));
exports.getAllAdmins = getAllAdmins;
const updateAdmin = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { name, img_profile, email, status } = req.body;
    const updates = [];
    const values = [];
    if (name !== undefined) {
        updates.push('name = ?');
        values.push(name);
    }
    if (img_profile !== undefined) {
        const UserData = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM admin_users WHERE id = ?', [id]);
        if (UserData.success && UserData.data && UserData.data.length > 0) {
            const img_profile_old = UserData.data[0].img_profile;
            if (img_profile_old && img_profile_old !== 'default.png') {
                const img_path = path.join(__dirname, '..', 'uploads', 'images', 'admin_users', img_profile_old);
                if (fs.existsSync(img_path)) {
                    fs.unlinkSync(img_path);
                }
            }
            updates.push('img_profile = ?');
            values.push(img_profile);
        }
    }
    if (email !== undefined) {
        updates.push('email = ?');
        values.push(email);
    }
    if (status !== undefined) {
        updates.push('status = ?');
        values.push(status);
    }
    updates.push('updated_at = ?');
    values.push(new Date());
    if (updates.length === 1) {
        res.status(400).json({ error: 'No fields to update' });
        return;
    }
    values.push(id);
    const query = `UPDATE admin_users 
                 SET ${updates.join(', ')}
                 WHERE id = ?`;
    const result = yield (0, orm_util_1.executeNonQuery)(query, values);
    if (result.success) {
        res.json({
            message: 'Admin updated successfully',
            affectedRows: result.affectedRows,
        });
    }
    else {
        res.status(500).json({ error: result.error });
    }
}));
exports.updateAdmin = updateAdmin;
const deleteAdmin = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const AdminData = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM admin_users WHERE id = ?', [id]);
    if (AdminData.success && AdminData.data && AdminData.data.length > 0) {
        const img_profile = AdminData.data[0].img_profile;
        if (img_profile && img_profile !== 'default.png') {
            const img_path = path.join(__dirname, '..', 'uploads', 'images', 'admin_users', img_profile);
            if (fs.existsSync(img_path)) {
                fs.unlinkSync(img_path);
            }
        }
    }
    const result = yield (0, orm_util_1.executeNonQuery)('DELETE FROM admin_users WHERE id = ?', [
        id,
    ]);
    if (result.success) {
        res.json({
            message: 'Admin deleted successfully',
            affectedRows: result.affectedRows,
        });
    }
    else {
        res.status(500).json({ error: result.error });
    }
}));
exports.deleteAdmin = deleteAdmin;
const loginAdmin = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { email, password } = req.body;
    const result = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM admin_users WHERE email = ?', [email]);
    if (!result.success || !result.data || result.data.length === 0) {
        res.status(401).json({ error: 'Invalid credentials' });
        return;
    }
    const admin = result.data[0];
    if (admin.status !== 'active') {
        res.status(403).json({ error: 'Account is not active' });
        return;
    }
    const isValidPassword = yield bcrypt_1.default.compare(password, admin.password_hash);
    if (!isValidPassword) {
        res.status(401).json({ error: 'Invalid credentials' });
        return;
    }
    yield (0, orm_util_1.executeNonQuery)('UPDATE admin_users SET last_login = ? WHERE id = ?', [
        new Date(),
        admin.id,
    ]);
    const token = (0, admin_access_1.generateAdminJWTToken)(admin);
    res.json({
        message: 'Login successful',
        token,
        admin: {
            id: admin.id,
            name: admin.name,
            email: admin.email,
            role: admin.role,
            status: admin.status,
        },
    });
}));
exports.loginAdmin = loginAdmin;
const createUser = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { military_id, name, rank, department, active, username, password, phone_number, img_profile, city } = req.body;
    const existingUser = yield (0, user_access_1.isPoliceUserExist)(username);
    if (existingUser) {
        res.status(400).json({ error: 'Police User already exists' });
        return;
    }
    const hashedPassword = yield bcrypt_1.default.hash(password, parseInt(process.env.SALT_PASSWORD || '10'));
    const query = `INSERT INTO police_users (military_id, name, \`rank\`, department, active, username, city, password_hash, phone_number, img_profile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    const result = yield (0, orm_util_1.executeNonQuery)(query, [military_id, name, rank, department, active, username, city, hashedPassword, phone_number, img_profile]);
    if (result.success) {
        res.status(200).json({ message: 'Police User created successfully' });
    }
    else {
        res.status(500).json({ error: result.error });
    }
}));
exports.createUser = createUser;
const getAllUsers = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const offset = (page - 1) * limit;
    const countResult = yield (0, orm_util_1.executeSingleQuery)('SELECT COUNT(*) as total FROM police_users');
    const result = yield (0, orm_util_1.executeQuery)(`SELECT id, military_id, name, \`rank\`, department, city, active, username, phone_number, img_profile, last_login, created_at , online, updated_at 
     FROM police_users 
     ORDER BY created_at ASC 
     LIMIT ? OFFSET ?`, [limit, offset]);
    if (result.success && result.data && countResult.success && countResult.data) {
        const response = {
            data: result.data.map(user => ({
                id: user.id,
                badgeNum: user.military_id,
                name: user.name,
                rank: user.rank,
                department: user.department,
                city: user.city,
                active: user.active,
                username: user.username,
                phone_number: user.phone_number,
                img_profile: req.protocol + '://' + req.get('host') + '/uploads/images/police_users/' + user.img_profile,
                last_login: user.last_login,
                online: user.online,
                created_at: user.created_at,
                updated_at: user.updated_at
            })),
            pagination: {
                total: countResult.data[0].total,
                page,
                limit,
                totalPages: Math.ceil(countResult.data[0].total / limit)
            }
        };
        res.json(response);
    }
    else {
        res.status(500).json({ error: result.error || countResult.error });
    }
}));
exports.getAllUsers = getAllUsers;
const getUser = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const result = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM police_users WHERE id = ?', [id]);
    if (result.success && result.data && result.data.length > 0) {
        const user = result.data[0];
        const response = {
            id: user.id,
            badgeNum: user.military_id,
            name: user.name,
            rank: user.rank,
            department: user.department,
            city: user.city,
            active: user.active,
            username: user.username,
            phone_number: user.phone_number,
            img_profile: req.protocol + '://' + req.get('host') + '/uploads/images/police_users/' + user.img_profile,
            last_login: user.last_login,
            online: user.online,
            created_at: user.created_at,
            updated_at: user.updated_at
        };
        res.json(response);
    }
    else {
        res.status(404).json({ error: 'Police User not found' });
    }
}));
exports.getUser = getUser;
const deleteUser = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const UserData = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM police_users WHERE id = ?', [id]);
    if (UserData.success && UserData.data && UserData.data.length > 0) {
        const img_profile = UserData.data[0].img_profile;
        if (img_profile) {
            const img_path = path.join(__dirname, '..', 'uploads', 'images', 'police_users', img_profile);
            if (fs.existsSync(img_path)) {
                fs.unlinkSync(img_path);
            }
        }
        const result = yield (0, orm_util_1.executeNonQuery)('DELETE FROM police_users WHERE id = ?', [id]);
        if (result.success) {
            res.json({ message: 'Police User deleted successfully' });
        }
        else {
            res.status(500).json({ error: result.error });
        }
    }
    else {
        res.status(404).json({ error: 'Police User not found' });
    }
}));
exports.deleteUser = deleteUser;
const updateUser = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { military_id, name, rank, department, city, active, username, phone_number, img_profile } = req.body;
    const updates = [];
    const values = [];
    if (military_id !== undefined) {
        updates.push('military_id = ?');
        values.push(military_id);
    }
    if (name !== undefined) {
        updates.push('name = ?');
        values.push(name);
    }
    if (rank !== undefined) {
        updates.push('`rank` = ?');
        values.push(rank);
    }
    if (department !== undefined) {
        updates.push('department = ?');
        values.push(department);
    }
    if (city !== undefined) {
        updates.push('city = ?');
        values.push(city);
    }
    if (active !== undefined) {
        updates.push('active = ?');
        values.push(active);
    }
    if (username !== undefined) {
        updates.push('username = ?');
        values.push(username);
    }
    if (phone_number !== undefined) {
        updates.push('phone_number = ?');
        values.push(phone_number);
    }
    if (img_profile !== undefined) {
        const UserData = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM police_users WHERE id = ?', [id]);
        if (UserData.success && UserData.data && UserData.data.length > 0) {
            const img_profile_old = UserData.data[0].img_profile;
            if (img_profile_old && img_profile_old !== 'default.png') {
                const img_path = path.join(__dirname, '..', 'uploads', 'images', 'police_users', img_profile_old);
                if (fs.existsSync(img_path)) {
                    fs.unlinkSync(img_path);
                }
            }
            updates.push('img_profile = ?');
            values.push(img_profile);
        }
    }
    if (updates.length === 0) {
        res.status(400).json({ error: 'No fields to update' });
        return;
    }
    updates.push('updated_at = ?');
    values.push(new Date());
    values.push(id);
    const query = `UPDATE police_users 
                 SET ${updates.join(', ')}
                 WHERE id = ?`;
    const result = yield (0, orm_util_1.executeNonQuery)(query, values);
    if (result.success) {
        res.json({
            message: 'Police User updated successfully',
            affectedRows: result.affectedRows,
        });
    }
    else {
        res.status(500).json({ error: result.error });
    }
}));
exports.updateUser = updateUser;
