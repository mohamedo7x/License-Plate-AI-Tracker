"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AdminStatus = exports.AdminRole = void 0;
var AdminRole;
(function (AdminRole) {
    AdminRole["SuperAdmin"] = "superadmin";
    AdminRole["Admin"] = "admin";
    AdminRole["Moderator"] = "moderator";
})(AdminRole || (exports.AdminRole = AdminRole = {}));
var AdminStatus;
(function (AdminStatus) {
    AdminStatus["Active"] = "active";
    AdminStatus["Inactive"] = "inactive";
    AdminStatus["Suspended"] = "suspended";
})(AdminStatus || (exports.AdminStatus = AdminStatus = {}));
