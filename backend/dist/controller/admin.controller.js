"use strict";
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
exports.loginAdmin = exports.deleteAdmin = exports.updateAdmin = exports.getAllAdmins = exports.getAdmin = exports.createAdmin = void 0;
const asyncHandler_1 = __importDefault(require("../middleware/asyncHandler"));
const query_util_1 = require("../utils/query.util");
const bcrypt_1 = __importDefault(require("bcrypt"));
const auth_access_1 = require("../auth/auth.access");
const createAdmin = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { name, img_profile, email, password_hash } = req.body;
    const query = `INSERT INTO admin_users (name, img_profile, email, password_hash, role, status, created_at) 
                   VALUES (?, ?, ?, ?, ?, ?, ?)`;
    const values = [
        name,
        img_profile,
        email,
        password_hash,
        'superadmin',
        'active',
        new Date(),
    ];
    const result = yield (0, query_util_1.executeNonQuery)(query, values);
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
    const result = yield (0, query_util_1.executeSingleQuery)('SELECT * FROM admin_users WHERE id = ?', [id]);
    if (result.success && result.data && result.data.length > 0) {
        res.json(result.data[0]);
    }
    else {
        res.status(404).json({ error: 'Admin not found' });
    }
}));
exports.getAdmin = getAdmin;
const getAllAdmins = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const result = yield (0, query_util_1.executeQuery)('SELECT * FROM admin_users ORDER BY created_at DESC');
    if (result.success && result.data) {
        res.json(result.data);
    }
    else {
        res.status(500).json({ error: result.error });
    }
}));
exports.getAllAdmins = getAllAdmins;
const updateAdmin = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { name, img_profile, email, status } = req.body;
    const query = `UPDATE admin_users 
                   SET name = ?, img_profile = ?, email = ?, status = ?, updated_at = ?
                   WHERE id = ?`;
    const values = [name, img_profile, email, status, new Date(), id];
    const result = yield (0, query_util_1.executeNonQuery)(query, values);
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
    const result = yield (0, query_util_1.executeNonQuery)('DELETE FROM admin_users WHERE id = ?', [
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
const loginAdmin = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { email, password } = req.body;
        const result = yield (0, query_util_1.executeSingleQuery)('SELECT * FROM admin_users WHERE email = ?', [email]);
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
        yield (0, query_util_1.executeQuery)('UPDATE admin_users SET last_login = ? WHERE id = ?', [new Date(), admin.id]);
        const userForToken = {
            id: admin.id || 0,
            name: admin.name,
            username: admin.email,
            password_hash: admin.password_hash,
            role_id: admin.role_id || 1,
            active: admin.status === 'active',
            last_login: new Date()
        };
        const token = (0, auth_access_1.generateJWTToken)(userForToken);
        res.json({
            message: 'Login successful',
            token,
            admin: {
                id: admin.id,
                name: admin.name,
                email: admin.email,
                role: admin.role,
                status: admin.status
            }
        });
    }
    catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});
exports.loginAdmin = loginAdmin;
