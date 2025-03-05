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
exports.SqlDataStore = void 0;
const promise_1 = __importDefault(require("mysql2/promise"));
const dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
class SqlDataStore {
    openDb() {
        return __awaiter(this, void 0, void 0, function* () {
            const { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT } = process.env;
            try {
                console.log('Connecting to MySQL database...');
                this.pool = promise_1.default.createPool({
                    host: DB_HOST,
                    user: DB_USER,
                    password: DB_PASSWORD,
                    database: DB_NAME,
                    port: Number(DB_PORT) || 3306,
                    waitForConnections: true,
                    connectionLimit: 10,
                    queueLimit: 0,
                });
                console.log('MySQL database connected.');
                return this;
            }
            catch (error) {
                console.error('Failed to connect to MySQL:', error);
                process.exit(1);
            }
        });
    }
}
exports.SqlDataStore = SqlDataStore;
