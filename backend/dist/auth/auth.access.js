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
exports.isUserExist = isUserExist;
exports.extractJWTToken = extractJWTToken;
exports.validateJWTToken = validateJWTToken;
exports.checkUserPrivilege = checkUserPrivilege;
exports.isAdmin = isAdmin;
exports.isModerator = isModerator;
exports.isUser = isUser;
exports.generateJWTToken = generateJWTToken;
const Database_1 = require("../database/Database");
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const JWT_SECRET = process.env.JWT_SECRET || '';
function isUserExist(username) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const db = yield (0, Database_1.getConnection)();
            const [rows] = yield db.query('SELECT * FROM users WHERE username = ?', [
                username,
            ]);
            const users = rows;
            return users.length > 0 ? users[0] : false;
        }
        catch (error) {
            console.error('Error checking user existence:', error);
            return false;
        }
    });
}
function extractJWTToken(req) {
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return null;
    }
    return authHeader.split(' ')[1];
}
function validateJWTToken(token) {
    try {
        return jsonwebtoken_1.default.verify(token, JWT_SECRET);
    }
    catch (error) {
        return null;
    }
}
function checkUserPrivilege(userId, requiredRoleId) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const db = yield (0, Database_1.getConnection)();
            const [rows] = yield db.query('SELECT role_id FROM users WHERE id = ?', [
                userId,
            ]);
            const users = rows;
            if (users.length === 0)
                return false;
            const userRoleId = users[0].role_id;
            return userRoleId === requiredRoleId;
        }
        catch (error) {
            console.error('Error checking user privilege:', error);
            return false;
        }
    });
}
function isAdmin(userId) {
    return __awaiter(this, void 0, void 0, function* () {
        return checkUserPrivilege(userId, 1); // Assuming 1 is admin role_id
    });
}
function isModerator(userId) {
    return __awaiter(this, void 0, void 0, function* () {
        return checkUserPrivilege(userId, 2); // Assuming 2 is moderator role_id
    });
}
function isUser(userId) {
    return __awaiter(this, void 0, void 0, function* () {
        return checkUserPrivilege(userId, 3); // Assuming 3 is user role_id
    });
}
function generateJWTToken(user) {
    return jsonwebtoken_1.default.sign({
        id: user.id,
        username: user.username,
        role_id: user.role_id,
    }, JWT_SECRET, { expiresIn: '24h' });
}
