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
const dotenv_1 = __importDefault(require("dotenv"));
const datastore_1 = require("./datastore");
const loggerMiddleWare_1 = require("./middleware/loggerMiddleWare");
const app = (0, express_1.default)();
dotenv_1.default.config();
app.use(loggerMiddleWare_1.loggerMiddleware);
app.use(express_1.default.json());
app.get('/', (_req, res) => {
    res.send('Welcome');
});
app.listen(process.env.PORT || 8080, () => __awaiter(void 0, void 0, void 0, function* () {
    yield (0, datastore_1.initDb)();
    console.log(`server work http://localhost:${process.env.PORT}`);
}));
