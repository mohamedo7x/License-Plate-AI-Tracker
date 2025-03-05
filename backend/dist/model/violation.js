"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ViolationStatus = void 0;
var ViolationStatus;
(function (ViolationStatus) {
    ViolationStatus["Pending"] = "Pending";
    ViolationStatus["UnderInvestigation"] = "Under Investigation";
    ViolationStatus["Resolved"] = "Resolved";
    ViolationStatus["Escalated"] = "Escalated";
    ViolationStatus["Dismissed"] = "Dismissed";
    ViolationStatus["Overdue"] = "Overdue";
    ViolationStatus["Appealed"] = "Appealed";
    ViolationStatus["CourtProceedings"] = "Court Proceedings";
    ViolationStatus["Paid"] = "Paid";
    ViolationStatus["PartiallyPaid"] = "Partially Paid";
})(ViolationStatus || (exports.ViolationStatus = ViolationStatus = {}));
