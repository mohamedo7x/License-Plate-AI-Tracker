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
Object.defineProperty(exports, "__esModule", { value: true });
exports.validateLoginBody = exports.validateAdminId = exports.validateUpdateAdminBody = exports.validateCreateAdminBody = exports.validateAdminToken = void 0;
const user_access_1 = require("../auth/user.access");
const admin_access_1 = require("../auth/admin.access");
const errorHandler_1 = require("./errorHandler");
const validateAdminToken = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const token = (0, user_access_1.extractJWTToken)(req);
        if (!token) {
            throw new errorHandler_1.UnauthorizedError('No token provided');
        }
        const decoded = (0, user_access_1.validateJWTToken)(token);
        if (!decoded || !decoded.id) {
            throw new errorHandler_1.UnauthorizedError('Invalid token format');
        }
        const isUserAdmin = yield (0, admin_access_1.isAdmin)(decoded.id);
        const isUserSuperAdmin = yield (0, admin_access_1.isSuperAdmin)(decoded.id);
        if (!isUserAdmin && !isUserSuperAdmin) {
            throw new errorHandler_1.ForbiddenError('Access denied. Admin privileges required.');
        }
        res.locals.user = decoded;
        next();
    }
    catch (error) {
        next(error);
    }
});
exports.validateAdminToken = validateAdminToken;
const validateCreateAdminBody = (req, res, next) => {
    try {
        const { name, email, password_hash } = req.body;
        if (!name || !email || !password_hash) {
            throw new errorHandler_1.ValidationError('Missing required fields: name, email, password_hash');
        }
        if (typeof name !== 'string' || name.trim().length < 2) {
            throw new errorHandler_1.ValidationError('Name must be at least 2 characters long');
        }
        if (!email.includes('@')) {
            throw new errorHandler_1.ValidationError('Email must contain @ symbol');
        }
        const [localPart, domain] = email.split('@');
        if (!localPart || !domain) {
            throw new errorHandler_1.ValidationError('Invalid email format');
        }
        if (localPart.length < 2) {
            throw new errorHandler_1.ValidationError('Email local part must be at least 2 characters');
        }
        if (!domain.includes('.')) {
            throw new errorHandler_1.ValidationError('Email domain must contain a dot (.)');
        }
        const [domainName, extension] = domain.split('.');
        if (!domainName || !extension) {
            throw new errorHandler_1.ValidationError('Invalid email domain format');
        }
        if (extension.length < 2) {
            throw new errorHandler_1.ValidationError('Email extension must be at least 2 characters');
        }
        if (typeof password_hash !== 'string' || password_hash.length < 6) {
            throw new errorHandler_1.ValidationError('Password must be at least 6 characters long');
        }
        next();
    }
    catch (error) {
        next(error);
    }
};
exports.validateCreateAdminBody = validateCreateAdminBody;
const validateUpdateAdminBody = (req, res, next) => {
    try {
        const { name, email, status } = req.body;
        if (!name && !email && !status) {
            throw new errorHandler_1.ValidationError('At least one field is required for update');
        }
        if (name && (typeof name !== 'string' || name.trim().length < 2)) {
            throw new errorHandler_1.ValidationError('Name must be at least 2 characters long');
        }
        if (email) {
            if (!email.includes('@')) {
                throw new errorHandler_1.ValidationError('Email must contain @ symbol');
            }
            const [localPart, domain] = email.split('@');
            if (!localPart || !domain) {
                throw new errorHandler_1.ValidationError('Invalid email format');
            }
            if (localPart.length < 2) {
                throw new errorHandler_1.ValidationError('Email local part must be at least 2 characters');
            }
            if (!domain.includes('.')) {
                throw new errorHandler_1.ValidationError('Email domain must contain a dot (.)');
            }
            const [domainName, extension] = domain.split('.');
            if (!domainName || !extension) {
                throw new errorHandler_1.ValidationError('Invalid email domain format');
            }
            if (extension.length < 2) {
                throw new errorHandler_1.ValidationError('Email extension must be at least 2 characters');
            }
        }
        if (status && !['active', 'inactive'].includes(status)) {
            throw new errorHandler_1.ValidationError('Invalid status value. Allowed values: active, inactive');
        }
        next();
    }
    catch (error) {
        next(error);
    }
};
exports.validateUpdateAdminBody = validateUpdateAdminBody;
const validateAdminId = (req, res, next) => {
    try {
        const { id } = req.params;
        const adminId = parseInt(id);
        if (isNaN(adminId) || adminId <= 0) {
            throw new errorHandler_1.ValidationError('Invalid admin ID format');
        }
        req.params.id = adminId.toString();
        next();
    }
    catch (error) {
        next(error);
    }
};
exports.validateAdminId = validateAdminId;
const validateLoginBody = (req, res, next) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            throw new errorHandler_1.ValidationError('Missing required fields: email, password');
        }
        if (!email.includes('@')) {
            throw new errorHandler_1.ValidationError('Email must contain @ symbol');
        }
        const [localPart, domain] = email.split('@');
        if (!localPart || !domain) {
            throw new errorHandler_1.ValidationError('Invalid email format');
        }
        if (localPart.length < 2) {
            throw new errorHandler_1.ValidationError('Email local part must be at least 2 characters');
        }
        if (!domain.includes('.')) {
            throw new errorHandler_1.ValidationError('Email domain must contain a dot (.)');
        }
        const [domainName, extension] = domain.split('.');
        if (!domainName || !extension) {
            throw new errorHandler_1.ValidationError('Invalid email domain format');
        }
        if (extension.length < 2) {
            throw new errorHandler_1.ValidationError('Email extension must be at least 2 characters');
        }
        if (typeof password !== 'string' || password.length < 6) {
            throw new errorHandler_1.ValidationError('Password must be at least 6 characters long');
        }
        next();
    }
    catch (error) {
        next(error);
    }
};
exports.validateLoginBody = validateLoginBody;
