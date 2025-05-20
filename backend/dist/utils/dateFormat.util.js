"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.formatDate = void 0;
const dayjs_1 = __importDefault(require("dayjs"));
require("dayjs/locale/ar");
const advancedFormat_1 = __importDefault(require("dayjs/plugin/advancedFormat"));
dayjs_1.default.extend(advancedFormat_1.default);
dayjs_1.default.locale('ar');
const formatDate = (dateString) => {
    return (0, dayjs_1.default)(dateString).format('D MMMM YYYY');
};
exports.formatDate = formatDate;
