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
const express_1 = __importDefault(require("express"));
const errorhandler_1 = __importDefault(require("errorhandler"));
const dotenv_1 = __importDefault(require("dotenv"));
const Database_1 = require("./database/Database");
const index_1 = __importDefault(require("./routes/index"));
const cors_1 = __importDefault(require("cors"));
const path_1 = __importDefault(require("path"));
const morgan_1 = __importDefault(require("morgan"));
const app = (0, express_1.default)();
app.use(express_1.default.json());
app.use((0, cors_1.default)());
app.use(express_1.default.static(path_1.default.join(__dirname, 'images')));
app.use((0, morgan_1.default)('dev'));
dotenv_1.default.config();
app.get('/healthz', (_, response) => {
    response.status(200).send('Server Work');
});
if (process.env.NODE_ENV === 'development') {
    console.log('Dev Mode');
    app.use((0, errorhandler_1.default)());
}
// ************** ROUTES ************** //
app.use(index_1.default);
const startServer = () => __awaiter(void 0, void 0, void 0, function* () {
    const db = yield (0, Database_1.StartConnectionToDb)();
    app.get('/isDbAlive', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        const connection = yield (0, Database_1.getConnection)();
        const [rows] = yield connection.execute("SELECT 'Hello, World! FROM MYSQL' AS message");
        res.json(rows);
    }));
    app.listen(process.env.PORT, () => {
        const port = process.env.PORT;
        console.log('http://localhost:' + port);
    });
});
startServer();
