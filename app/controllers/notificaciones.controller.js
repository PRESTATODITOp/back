//  importamos la base de datos para hacer la consulta
import { pool } from "../config/database/db";

//Notificacionas

export const findAllNotificaion= async (req, res) => {

    try {
       const [rows] = await pool.query("CALL spFindAllNotificacion();");
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const findNotificaion= async (req, res) => {
    const id = req.params.id;
    try {
       const [rows] = await pool.query(`CALL spFindNotificacion(${id});`);
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const insertNotificaion= async (req, res) => {
    const descripcion = req.body.descripcion;
    const estado = req.body.estado;
    const id_usuario = req.body.id_usuario;
    try {
       const result = await pool.query(`CALL spInsertNotificacion('${descripcion}','${estado}','${id_usuario}');`);
       res.json(result);
    } catch (error) {
       console.error("Ha ocurrido un error" + error);
    }
 
 };
 export const deleteNotificaion= async (req, res) => {
    const id = req.params.id;
    try {
       const result = await pool.query(`CALL spDeleteNotificacion(${id})`);
       if (result[0].affectedRows == 1)
          res.json(result);
       else
          res.json({ "Error": "no lo borro"});
    } catch (error) {
       console.error(error);
 
    }
 
 };
 export const updateNotificaion= async (req, res) => {
 
    const id = req.params.id;
    const descripcion = req.body.descripcion;
    const estado = req.body.estado;
    const id_usuario = req.body.id_usuario;
 
 
    try {
       const result = await pool.query(`CALL spUpdateNotificacion('${id}','${descripcion}','${estado}','${id_usuario}');`)
       if (result[0].affectedRows != 0)
          res.json(result);
       else
          res.json({ "Error": "NO ACTUALIZO" });
 
    } catch (error) {
       console.error(error);
 
    }
 };