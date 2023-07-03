//  importamos la base de datos para hacer la consulta
import { pool } from "../config/database/db";

//Herramienta

export const findAllHerramienta = async (req, res) => {

    try {
       const [rows] = await pool.query("CALL spFindAllHerramienta();");
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const findHerramienta = async (req, res) => {
    const id = req.params.id;
    try {
       const [rows] = await pool.query(`CALL spFindHerramienta(${id});`);
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const insertHerramienta = async (req, res) => {
    const tipo = req.body.tipo;
    const color = req.body.color;
    
 
    try {
       const result = await pool.query(`CALL spInsertHerramienta('${tipo}','${color}');`);
       res.json(result);
    } catch (error) {
       console.error("Ha ocurrido un error" + error);
    }
 };
 export const deleteHerramienta = async (req, res) => {
    const id = req.params.id;
    try {
       const result = await pool.query(`CALL spDeleteHerramienta(${id})`);
       if (result[0].affectedRows == 1)
          res.json(result);
       else
          res.json({ "Error": "no lo borro" });
    } catch (error) {
       console.error(error);
 
    }
 
 };
 export const updateHerramienta = async (req, res) => {
   const id = req.params.id;
   const tipo = req.body.tipo;
    const color = req.body.color;
 
    try {
       const result = await pool.query(`CALL spUpdateHerramienta('${id}','${tipo}','${color}');`);
       if (result[0].affectedRows != 0)
          res.json(result);
       else
          res.json({ "Error": "NO ACTUALIZO" });
 
    } catch (error) {
       console.error(error);
 
    }
 };