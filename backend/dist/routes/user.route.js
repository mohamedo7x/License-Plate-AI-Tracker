"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const user_controller_1 = require("../controller/user.controller");
const user_validation_1 = require("../validation/user.validation");
const validateRequest_1 = require("../middleware/validateRequest");
const user_access_1 = require("../auth/user.access");
const multer_middleware_1 = require("../middleware/multer.middleware");
const route = (0, express_1.Router)();
route.post('/register', user_validation_1.validateUser, validateRequest_1.validateRequest, user_controller_1.register);
route.post('/login', user_validation_1.validateUserLogin, validateRequest_1.validateRequest, user_controller_1.login);
route.get('/veh/:id', user_access_1.validateUserToken, user_controller_1.searchVehcile);
route.post('/report', user_access_1.validateUserToken, multer_middleware_1.uploadMultiFiles, user_validation_1.userReportValidation, validateRequest_1.validateRequest, user_controller_1.createReport);
route.get('/report/:id', user_access_1.validateUserToken, user_controller_1.getReport);
route.post('/objection', user_access_1.validateUserToken, user_validation_1.validateUserObjection, validateRequest_1.validateRequest, user_controller_1.generateObjection);
exports.default = route;
