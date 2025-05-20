"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const admin_person_controller_1 = require("../controller/admin.person.controller");
const person_validation_1 = require("../validation/person.validation");
const validateRequest_1 = require("../middleware/validateRequest");
const police_user_access_1 = require("../auth/police_user.access");
const router = (0, express_1.Router)();
/**
 * @route   GET /api/person/admin
 * @desc    get Person Using ID
 * @access  Private ( Admin only)
 **/
router
    .route('/:id')
    .get(police_user_access_1.validatePoliceToken, person_validation_1.PersonValidation, validateRequest_1.validateRequest, admin_person_controller_1.getPersonByID);
exports.default = router;
