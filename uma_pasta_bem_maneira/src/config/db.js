import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const pool=new pg.Pool({
    user:process.env.DB_USER,
    database:process.env.DB_NAME,
    password:process.env.DB_PASSWORD,
    host:process.env.DB_HOST,
    port:Number(process.env.DB_PORT),
})

export const query = (text, params)=> pool.query(text, params);