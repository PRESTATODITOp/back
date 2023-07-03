// funcion que perite hacer la conexion a bd
import { createPool } from "mysql2/promise";

export const pool = createPool({
    // parametros para hacer la conexion,tiene un orden || VARIABLES 
     user:process.env.DB_USER,
     password:process.env.DB_PASSWORD,
     host:process.env.DB_HOST,
     port:process.env.DB_PORT,
     database:process.env.DB_NAME


});
