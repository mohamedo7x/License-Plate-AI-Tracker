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
exports.saveUploadedFile = exports.uploadFile = void 0;
const multer_1 = __importDefault(require("multer"));
const path_1 = __importDefault(require("path"));
const crypto_1 = __importDefault(require("crypto"));
const fs_1 = __importDefault(require("fs"));
const util_1 = require("util");
const storage = multer_1.default.memoryStorage();
const fileFilter = (req, file, cb) => {
    if (file.mimetype.startsWith('image/')) {
        cb(null, true);
    }
    else {
        cb(new Error('Only image files are allowed'));
    }
};
const upload_middleware = (0, multer_1.default)({
    storage,
    fileFilter,
    limits: {
        fileSize: 5 * 1024 * 1024,
    },
});
exports.uploadFile = upload_middleware.single('img_profile');
const saveUploadedFile = (req) => __awaiter(void 0, void 0, void 0, function* () {
    if (!req.file) {
        throw new Error('No file uploaded');
    }
    const filename = crypto_1.default.randomBytes(10).toString('hex') + path_1.default.extname(req.file.originalname);
    let destination;
    if (req.originalUrl.includes('/police')) {
        destination = path_1.default.join(__dirname, '..', 'uploads', 'images', 'police_users');
    }
    else if (req.originalUrl.includes('/admin')) {
        destination = path_1.default.join(__dirname, '..', 'uploads', 'images', 'admin_users');
    }
    else {
        throw new Error('Invalid upload destination');
    }
    if (!fs_1.default.existsSync(destination)) {
        fs_1.default.mkdirSync(destination, { recursive: true });
    }
    const filePath = path_1.default.join(destination, filename);
    try {
        yield (0, util_1.promisify)(fs_1.default.writeFile)(filePath, req.file.buffer);
        if (!fs_1.default.existsSync(filePath)) {
            throw new Error('File was not written successfully');
        }
        return filename;
    }
    catch (error) {
        if (fs_1.default.existsSync(filePath)) {
            fs_1.default.unlinkSync(filePath);
        }
        throw error;
    }
});
exports.saveUploadedFile = saveUploadedFile;
