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
const auth_access_1 = require("../auth/auth.access");
const auth_access_2 = require("../auth/auth.access");
const validateAdminToken = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const token = (0, auth_access_1.extractJWTToken)(req);
        if (!token) {
            res.status(401).json({ error: 'No token provided' });
            return;
        }
        const decoded = (0, auth_access_1.validateJWTToken)(token);
        if (!decoded || !decoded.id) {
            res.status(401).json({ error: 'Invalid token format' });
            return;
        }
        const isUserAdmin = yield (0, auth_access_2.isAdmin)(decoded.id);
        if (!isUserAdmin) {
            res
                .status(403)
                .json({ error: 'Access denied. Admin privileges required.' });
            return;
        }
        res.locals.user = decoded;
        next();
    }
    catch (error) {
        res.status(401).json({ error: 'Authentication failed' });
    }
});
exports.validateAdminToken = validateAdminToken;
const validateCreateAdminBody = (req, res, next) => {
    const { name, email, password_hash } = req.body;
    if (!name || !email || !password_hash) {
        res.status(400).json({
            error: 'Missing required fields',
            required: ['name', 'email', 'password_hash'],
        });
        return;
    }
    if (typeof name !== 'string' || name.trim().length < 2) {
        res.status(400).json({ error: 'Name must be at least 2 characters long' });
        return;
    }
    if (!email.includes('@')) {
        res.status(400).json({ error: 'Email must contain @ symbol' });
        return;
    }
    const [localPart, domain] = email.split('@');
    if (!localPart || !domain) {
        res.status(400).json({ error: 'Invalid email format' });
        return;
    }
    if (localPart.length < 2) {
        res
            .status(400)
            .json({ error: 'Email local part must be at least 2 characters' });
        return;
    }
    if (!domain.includes('.')) {
        res.status(400).json({ error: 'Email domain must contain a dot (.)' });
        return;
    }
    const [domainName, extension] = domain.split('.');
    if (!domainName || !extension) {
        res.status(400).json({ error: 'Invalid email domain format' });
        return;
    }
    if (extension.length < 2) {
        res
            .status(400)
            .json({ error: 'Email extension must be at least 2 characters' });
        return;
    }
    if (typeof password_hash !== 'string' || password_hash.length < 60) {
        res.status(400).json({ error: 'Invalid password hash format' });
        return;
    }
    next();
};
exports.validateCreateAdminBody = validateCreateAdminBody;
const validateUpdateAdminBody = (req, res, next) => {
    const { name, email, status } = req.body;
    if (!name && !email && !status) {
        res.status(400).json({
            error: 'At least one field is required for update',
            allowed: ['name', 'email', 'status'],
        });
        return;
    }
    if (name && (typeof name !== 'string' || name.trim().length < 2)) {
        res.status(400).json({ error: 'Name must be at least 2 characters long' });
        return;
    }
    if (email) {
        if (!email.includes('@')) {
            res.status(400).json({ error: 'Email must contain @ symbol' });
            return;
        }
        const [localPart, domain] = email.split('@');
        if (!localPart || !domain) {
            res.status(400).json({ error: 'Invalid email format' });
            return;
        }
        if (localPart.length < 2) {
            res
                .status(400)
                .json({ error: 'Email local part must be at least 2 characters' });
            return;
        }
        if (!domain.includes('.')) {
            res.status(400).json({ error: 'Email domain must contain a dot (.)' });
            return;
        }
        const [domainName, extension] = domain.split('.');
        if (!domainName || !extension) {
            res.status(400).json({ error: 'Invalid email domain format' });
            return;
        }
        if (extension.length < 2) {
            res
                .status(400)
                .json({ error: 'Email extension must be at least 2 characters' });
            return;
        }
    }
    if (status && !['active', 'inactive'].includes(status)) {
        res.status(400).json({
            error: 'Invalid status value',
            allowed: ['active', 'inactive'],
        });
        return;
    }
    next();
};
exports.validateUpdateAdminBody = validateUpdateAdminBody;
const validateAdminId = (req, res, next) => {
    const { id } = req.params;
    const adminId = parseInt(id);
    if (isNaN(adminId) || adminId <= 0) {
        res.status(400).json({ error: 'Invalid admin ID format' });
        return;
    }
    req.params.id = adminId.toString();
    next();
};
exports.validateAdminId = validateAdminId;
const validateLoginBody = (req, res, next) => {
    const { email, password } = req.body;
    if (!email || !password) {
        res.status(400).json({
            error: 'Missing required fields',
            required: ['email', 'password'],
        });
        return;
    }
    if (!email.includes('@')) {
        res.status(400).json({ error: 'Email must contain @ symbol' });
        return;
    }
    const [localPart, domain] = email.split('@');
    if (!localPart || !domain) {
        res.status(400).json({ error: 'Invalid email format' });
        return;
    }
    if (localPart.length < 2) {
        res
            .status(400)
            .json({ error: 'Email local part must be at least 2 characters' });
        return;
    }
    if (!domain.includes('.')) {
        res.status(400).json({ error: 'Email domain must contain a dot (.)' });
        return;
    }
    const [domainName, extension] = domain.split('.');
    if (!domainName || !extension) {
        res.status(400).json({ error: 'Invalid email domain format' });
        return;
    }
    if (extension.length < 2) {
        res
            .status(400)
            .json({ error: 'Email extension must be at least 2 characters' });
        return;
    }
    if (typeof password !== 'string' || password.length < 6) {
        res.status(400).json({ error: 'Password must be at least 6 characters long' });
        return;
    }
    next();
};
exports.validateLoginBody = validateLoginBody;
