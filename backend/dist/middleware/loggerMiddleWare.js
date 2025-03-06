"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.loggerMiddleware = void 0;
const morgan_1 = __importDefault(require("morgan"));
const LOGGER = {
    info: (message) => console.log('LOGGER INFO:', JSON.stringify(message)),
};
const customMorganFormat = (0, morgan_1.default)((tokens, req, res) => {
    return JSON.stringify({
        method: tokens.method(req, res),
        path: tokens.url(req, res),
        body: req.body && Object.keys(req.body).length ? req.body : undefined,
        status: tokens.status(req, res),
        responseTime: `${tokens['response-time'](req, res)} ms`,
    });
}, {
    stream: {
        write: message => LOGGER.info(JSON.parse(message)),
    },
});
const loggerMiddleware = (req, res, next) => {
    customMorganFormat(req, res, () => { });
    next();
};
exports.loggerMiddleware = loggerMiddleware;
