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
exports.changeCriminalStatus = exports.getPersons = exports.getPersonByID = void 0;
const asyncHandler_1 = __importDefault(require("../middleware/asyncHandler"));
const orm_util_1 = require("../utils/orm.util");
const dateFormat_util_1 = require("../utils/dateFormat.util");
exports.getPersonByID = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    const { id } = req.params;
    const query = `SELECT * FROM person WHERE national_id = ?`;
    const person = yield (0, orm_util_1.executeQuery)(query, [id]);
    if (((_a = person.data) === null || _a === void 0 ? void 0 : _a.length) === 0) {
        res.status(404).json({ message: 'Person not found' });
    }
    const personData = person.data
        ? person.data.map((person) => {
            return Object.assign(Object.assign({}, person), { date_of_birth: (0, dateFormat_util_1.formatDateV2)(person.date_of_birth), issue_date: (0, dateFormat_util_1.formatDateV2)(person.issue_date), expired_date: (0, dateFormat_util_1.formatDateV2)(person.expired_date), criminal_status: person.criminal_status === 1 ? 'مطلوب' : 'غير مطلوب' });
        })
        : [];
    res.status(200).json({ person: personData });
}));
exports.getPersons = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const offset = (page - 1) * limit;
    const query = 'SELECT * FROM person LIMIT ? OFFSET ?';
    const persons = yield (0, orm_util_1.executeQuery)(query, [limit, offset]);
    const PersonsData = persons.data
        ? persons.data.map((person) => {
            return Object.assign(Object.assign({}, person), { date_of_birth: (0, dateFormat_util_1.formatDateV2)(person.date_of_birth), issue_date: (0, dateFormat_util_1.formatDateV2)(person.issue_date), expired_date: (0, dateFormat_util_1.formatDateV2)(person.expired_date), criminal_status: person.criminal_status === 1 ? 'مطلوب' : 'غير مطلوب' });
        })
        : [];
    res.status(200).json({
        success: true,
        page: page,
        limit: limit,
        data: PersonsData,
    });
}));
exports.changeCriminalStatus = (0, asyncHandler_1.default)((req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { criminal_status } = req.body;
    const query = `UPDATE person SET criminal_status = ? WHERE national_id = ?`;
    const result = yield (0, orm_util_1.executeQuery)(query, [criminal_status, id]);
    res.status(200).json({ message: 'Criminal status updated successfully' });
}));
