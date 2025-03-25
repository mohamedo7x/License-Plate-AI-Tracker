import {User} from '../model/user.model';
import Database from '../database/Database';
import { Connection } from 'mysql2/promise'
export class UserController  {
    private db:Connection;
    constructor(){
        this.db =  Database.getInstance().getConnection();
    }


    async getAllUsers (req:Request , res:Response):Promise<User[]> {
        const [rows] = await this.db.execute('SELECT * FROM users');
        // return res.json(rows as User[]);
    }

}
