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
exports.createAdmin = void 0;
const Database_1 = require("../database/Database");
const asyncHandler_1 = __importDefault(require("../middleware/asyncHandler"));
const createAdmin = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const db = yield (0, Database_1.getConnection)();
    const { name, img_profile, email, password_hash } = req.body;
    const insertQuery = `INSERT INTO admin_users (name, img_profile, email, password_hash, role, status, created_at) 
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
    const [row] = yield db.execute(insertQuery, values);
    res.status(201).json({ message: 'Admin created successfully' });
}));
exports.createAdmin = createAdmin;
