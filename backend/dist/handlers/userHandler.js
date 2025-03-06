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
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserHandler = void 0;
class UserHandler {
    constructor(userDao) {
        this.createUser = (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
                res.status(201).json({
                    message: 'User Created Sucessfuly',
                });
                return;
            }
            catch (error) {
                res.status(500).json({ error: 'Error creating user' });
            }
        });
        this.findUserById = (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
            }
            catch (error) {
                res.status(500).json({ error: 'Error retrieving user' });
            }
        });
        this.findUserByUsername = (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
            }
            catch (error) {
                res.status(500).json({ error: 'Error retrieving user' });
            }
        });
        this.listAllUsers = (_req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
            }
            catch (error) {
                res.status(500).json({ error: 'Error retrieving users' });
            }
        });
        this.updateUser = (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
            }
            catch (error) {
                res.status(500).json({ error: 'Error updating user' });
            }
        });
        this.deleteUser = (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
            }
            catch (error) {
                res.status(500).json({ error: 'Error deleting user' });
            }
        });
        this.findUserByPhoneNumber = (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
            }
            catch (error) {
                res.status(500).json({ error: 'Error retrieving user' });
            }
        });
        this.updateUserLastLogin = (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
            }
            catch (error) {
                res.status(500).json({ error: 'Error updating last login' });
            }
        });
        this.listRecentUsers = (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
            }
            catch (error) {
                res.status(500).json({ error: 'Error retrieving recent users' });
            }
        });
        this.userDao = userDao;
    }
}
exports.UserHandler = UserHandler;
