"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const admin_route_1 = __importDefault(require("./admin.route"));
const vehicle_route_1 = __importDefault(require("./vehicle.route"));
const express_1 = require("express");
const route = (0, express_1.Router)();
route.use(`/admin`, admin_route_1.default);
route.use(`/vehicle`, vehicle_route_1.default);
exports.default = route;
