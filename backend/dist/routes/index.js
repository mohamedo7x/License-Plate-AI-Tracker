"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const admin_route_1 = __importDefault(require("./admin.route"));
const express_1 = require("express");
const auditlogs_route_1 = __importDefault(require("./auditlogs.route"));
const admin_middleware_1 = require("../middleware/admin.middleware");
const report_route_1 = __importDefault(require("./report.route"));
const police_route_1 = __importDefault(require("./police.route"));
const route = (0, express_1.Router)();
route.use(`/admin`, admin_route_1.default);
route.use(`/auditlogs`, admin_middleware_1.validateAdminToken, auditlogs_route_1.default);
route.use(`/police`, police_route_1.default);
route.use(`/report`, report_route_1.default);
exports.default = route;
