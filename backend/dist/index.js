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
const errorHandler_1 = require("./middleware/errorHandler");
const logger_1 = __importDefault(require("./utils/logger"));
const socket_io_1 = __importDefault(require("socket.io"));
const http_1 = __importDefault(require("http"));
const clients_1 = require("./utils/clients");
const app = (0, express_1.default)();
app.use(express_1.default.json());
app.use((0, cors_1.default)());
app.use(express_1.default.static(path_1.default.join(__dirname, 'images')));
app.use('/uploads/images', express_1.default.static(path_1.default.join(__dirname, 'uploads', 'images')));
const httpserver = http_1.default.createServer(app);
const io = new socket_io_1.default.Server(httpserver);
// SOCKET IO SERVER
io.on('connection', (socket) => {
    (0, clients_1.add)(socket);
    socket.on('disconnect', () => {
        (0, clients_1.remove)(socket);
    });
    socket.on('getAllClients', () => {
        const clients = (0, clients_1.getClientCount)();
        console.log('All clients:', clients);
    });
    socket.on('login', (data) => {
        console.log('User logged in:', data);
        socket.emit('loginSuccess', { message: 'Login successful' });
    });
});
app.use((req, res, next) => {
    const startTime = new Date();
    res.on('finish', () => {
        const endTime = new Date();
        const responseTime = endTime.getTime() - startTime.getTime();
        const logData = {
            method: req.method,
            url: req.url,
            status: res.statusCode,
            responseTime: `${responseTime}ms`,
            userAgent: req.get('user-agent'),
            ip: req.ip,
        };
        if (req.method !== 'GET' && req.body && Object.keys(req.body).length > 0) {
            logData.requestBody = req.body;
        }
        if (req.query && Object.keys(req.query).length > 0) {
            logData.requestQuery = req.query;
        }
        if (req.params && Object.keys(req.params).length > 0) {
            logData.requestParams = req.params;
        }
        logger_1.default.http('HTTP Request', logData);
    });
    next();
});
dotenv_1.default.config();
app.get('/healthz', (_, response) => {
    response.status(200).send('server work');
});
if (process.env.NODE_ENV === 'development') {
    app.use((0, errorhandler_1.default)());
}
// ************** ROUTES ************** //
app.use(index_1.default);
app.use(errorHandler_1.errorHandler);
const startServer = () => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield (0, Database_1.StartConnectionToDb)();
        app.get('/isDbAlive', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
            try {
                const connection = yield (0, Database_1.getConnection)();
                const [rows] = yield connection.execute("SELECT 'Hello, World! FROM MYSQL' AS message");
                res.json(rows);
            }
            catch (error) {
                res.status(500).json({ error: 'Database connection failed' });
            }
        }));
        const port = process.env.PORT;
        httpserver.listen(port, () => {
            console.log('Server started on port', port);
        });
    }
    catch (error) {
        console.error('Failed to start server:', error);
        process.exit(1);
    }
});
startServer();
