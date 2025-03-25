"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const admin_controller_1 = require("../controller/admin.controller");
const router = (0, express_1.Router)();
// @desc       Create new Admin
// @route      POST /admin
// @access     Private
router.route('/').post(admin_controller_1.createAdmin);
exports.default = router;
