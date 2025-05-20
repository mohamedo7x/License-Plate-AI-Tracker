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
var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
            if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
                t[p[i]] = s[p[i]];
        }
    return t;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getMyDetails = exports.loginPoliceUser = void 0;
const orm_util_1 = require("../utils/orm.util");
const police_user_access_1 = require("../auth/police_user.access");
const asyncHandler_1 = __importDefault(require("../middleware/asyncHandler"));
const bcrypt_1 = __importDefault(require("bcrypt"));
exports.loginPoliceUser = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { username, password } = req.body;
        const result = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM police_users WHERE username = ?', [username]);
        if (!result.success || !result.data || result.data.length === 0) {
            res.status(401).json({ message: 'Invalid username or password' });
            return;
        }
        const policeUser = result.data[0];
        const isPasswordValid = yield bcrypt_1.default.compare(password, policeUser.password_hash);
        if (!isPasswordValid) {
            res.status(401).json({ message: 'Invalid username or password' });
            return;
        }
        const token = (0, police_user_access_1.generatePoliceUserJWTToken)(policeUser);
        yield (0, orm_util_1.executeNonQuery)('UPDATE police_users SET last_login = ? WHERE id = ?', [new Date(), policeUser.id]);
        res.status(200).json({
            message: 'Police user logged in successfully',
            token,
            user: policeUser,
        });
    }
    catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
}));
exports.getMyDetails = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const user = req.user;
    const result = yield (0, orm_util_1.executeSingleQuery)('SELECT * FROM police_users WHERE id = ?', [user.id]);
    if (result.success && result.data && result.data.length > 0) {
        const userData = result.data[0];
        const { password_hash } = userData, safeUserData = __rest(userData, ["password_hash"]);
        res.status(200).json({
            success: true,
            data: safeUserData,
        });
    }
    else {
        res.status(404).json({
            success: false,
            message: 'User not found',
        });
    }
}));
