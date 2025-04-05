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
exports.isVehicleUser = exports.isUser = exports.validateJWTToken = exports.extractJWTToken = void 0;
exports.isPoliceUserExist = isPoliceUserExist;
exports.checkUserPrivilege = checkUserPrivilege;
exports.isAdmin = isAdmin;
exports.isModerator = isModerator;
exports.generateJWTToken = generateJWTToken;
const orm_util_1 = require("../utils/orm.util");
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const errorHandler_1 = require("../middleware/errorHandler");
const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key';
function isPoliceUserExist(username) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const result = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM police_users WHERE username = ?', [username]);
            return result.success && result.data && result.data.length > 0
                ? result.data[0]
                : false;
        }
        catch (error) {
            console.error('Error checking user existence:', error);
            return false;
        }
    });
}
const extractJWTToken = (req) => {
    const authHeader = req.headers.authorization;
    if (!authHeader) {
        throw new errorHandler_1.UnauthorizedError('Authorization header is missing. Please provide a valid token.');
    }
    const [bearer, token] = authHeader.split(' ');
    if (bearer !== 'Bearer' || !token) {
        throw new errorHandler_1.UnauthorizedError('Invalid authorization header format. Expected format: Bearer <token>');
    }
    return token;
};
exports.extractJWTToken = extractJWTToken;
const validateJWTToken = (token) => {
    try {
        return jsonwebtoken_1.default.verify(token, JWT_SECRET);
    }
    catch (error) {
        if (error instanceof jsonwebtoken_1.default.TokenExpiredError) {
            throw new errorHandler_1.UnauthorizedError('Token has expired. Please login again.');
        }
        if (error instanceof jsonwebtoken_1.default.JsonWebTokenError) {
            throw new errorHandler_1.UnauthorizedError('Invalid token. Please provide a valid authentication token.');
        }
        throw new errorHandler_1.UnauthorizedError('Failed to verify token. Please try again.');
    }
};
exports.validateJWTToken = validateJWTToken;
function checkUserPrivilege(userId, requiredRoleId) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const result = yield (0, orm_util_1.executeSingleQuery)('SELECT role_id FROM users WHERE id = ?', [userId]);
            if (!result.success || !result.data || result.data.length === 0)
                return false;
            const userRoleId = result.data[0].role_id;
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
        return checkUserPrivilege(userId, 1);
    });
}
function isModerator(userId) {
    return __awaiter(this, void 0, void 0, function* () {
        return checkUserPrivilege(userId, 2);
    });
}
const isUser = (userId) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const query = `
      SELECT r.role 
      FROM Users u
      JOIN Roles r ON u.role_id = r.id
      WHERE u.id = ? AND r.role = 'user'
    `;
        const result = yield (0, orm_util_1.executeSingleQuery)(query, [userId]);
        if (!result.success) {
            throw new errorHandler_1.ForbiddenError('Failed to verify user status. Database error occurred.');
        }
        return Boolean(result.data && result.data.length > 0);
    }
    catch (error) {
        if (error instanceof errorHandler_1.ForbiddenError) {
            throw error;
        }
        throw new errorHandler_1.ForbiddenError('Unable to verify user privileges. Please try again later.');
    }
});
exports.isUser = isUser;
const isVehicleUser = (userId) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const query = `
      SELECT r.role 
      FROM Users u
      JOIN Roles r ON u.role_id = r.id
      WHERE u.id = ? AND r.role = 'vehicle_user'
    `;
        const result = yield (0, orm_util_1.executeSingleQuery)(query, [userId]);
        if (!result.success) {
            throw new errorHandler_1.ForbiddenError('Failed to verify vehicle user status. Database error occurred.');
        }
        return Boolean(result.data && result.data.length > 0);
    }
    catch (error) {
        if (error instanceof errorHandler_1.ForbiddenError) {
            throw error;
        }
        throw new errorHandler_1.ForbiddenError('Unable to verify vehicle user privileges. Please try again later.');
    }
});
exports.isVehicleUser = isVehicleUser;
function generateJWTToken(user) {
    return jsonwebtoken_1.default.sign({
        id: user.id,
        username: user.username,
        role_id: user.role_id,
    }, JWT_SECRET, { expiresIn: '24h' });
}
