import { DataStore } from "..";
import mysql, { Pool } from "mysql2/promise";
import dotenv from 'dotenv';
import path from "path";
dotenv.config();
export class SqlDataStore {
    private pool!: Pool;
    
    public async openDb () {
        const { ENV, DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT } = process.env;
        try {
            console.log("Connecting to MySQL database...");
            this.pool = mysql.createPool({
              host: DB_HOST,
              user: DB_USER,
              password: DB_PASSWORD,
              database: DB_NAME,
              port: Number(DB_PORT) || 3306,
              waitForConnections: true,
              connectionLimit: 10,
              queueLimit: 0,
            });
            console.log("MySQL database connected.");
        } catch (error) {
            console.error("Failed to connect to MySQL:", error);
            process.exit(1);
        }
    }
}