import { Router } from "express";
import {UserController} from '../controller/user';
const UserRoute = Router();


// @desc       Create new Account
// @route      POST /api/v1/register
// @access     Public


const User = new UserController();
UserRoute.route('/register').get(User.getAllUsers());




export default UserRoute;