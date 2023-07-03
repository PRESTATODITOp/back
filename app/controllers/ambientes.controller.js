//  importamos la base de datos para hacer la consulta
import { pool } from "../config/database/db";


//AMBIENTES

export const findAllAmbientes = async (req, res) => {

    try {
       const [rows] = await pool.query("CALL spFindAllAmbientes();");
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const findAmbientes = async (req, res) => {
    const id = req.params.id;
    try {
       const [rows] = await pool.query(`CALL spFindAmbientes(${id});`);
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const insertAmbientes = async (req, res) => {
   const id_ambiente = req.body.id_ambiente;
    const cantidad_sillas = req.body.cantidad_sillas;
    const cantidad_mesas = req.body.cantidad_mesas;
    const num_aprendices = req.body.num_aprendices;
    const num_equipos = req.body.num_equipos;


 
    try {
       const result = await pool.query(`CALL spInsertAmbientes('${id_ambiente}','${cantidad_sillas}','${cantidad_mesas}','${num_aprendices}','${num_equipos}');`);
       res.json(result);
    } catch (error) {
       console.error("Ha ocurrido un error" + error);
    }
 
 };
 export const deleteAmbientes = async (req, res) => {
    const id = req.params.id;
    try {
       const result = await pool.query(`CALL spDeleteAmbientes(${id})`);
       if (result[0].affectedRows == 1)
          res.json(result);
       else
          res.json({ "Error": "no lo borro" });
    } catch (error) {
       console.error(error);
 
    }
 
 };
 export const updateAmbientes = async (req, res) => {
    const id = req.params.id;
    const cantidad_sillas = req.body.cantidad_sillas;
    const cantidad_mesas = req.body.cantidad_mesas;
    const num_aprendices = req.body.num_aprendices;
    const num_equipos = req.body.num_equipos;


 
    try {
       const result = await pool.query(`CALL spUpdateAmbientes(${id},'${cantidad_sillas}','${cantidad_mesas}','${num_aprendices}','${num_equipos}');`)
       if (result[0].affectedRows != 0)
          res.json(result);
       else
          res.json({ "Error": "NO ACTUALIZO" });
 
    } catch (error) {
       console.error(error);
 
    }
 };