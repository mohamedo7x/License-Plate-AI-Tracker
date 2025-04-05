"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.uploadFile = void 0;
const multer_1 = __importDefault(require("multer"));
const path_1 = __importDefault(require("path"));
const crypto_1 = __importDefault(require("crypto"));
const upload_img_police_users = multer_1.default.diskStorage({
    destination: (req, file, cb) => {
        if (req.path.includes('/police')) {
            cb(null, path_1.default.join(__dirname, '..', 'uploads', 'images', 'police_users'));
        }
        else {
            cb(null, path_1.default.join(__dirname, '..', 'uploads', 'images', 'admin_users'));
        }
    },
    filename: (req, file, cb) => {
        const filename = crypto_1.default.randomBytes(10).toString('hex') + path_1.default.extname(file.originalname);
        cb(null, filename);
        req.body.img_profile = filename;
    }
});
const upload_middleware = (0, multer_1.default)({ storage: upload_img_police_users });
exports.uploadFile = upload_middleware.single('img_profile');
