//  importamos la base de datos para hacer la consulta
import { pool } from "../config/database/db";


//INVENTARIO

export const findAllInventario= async (req, res) => {

    try {
       const [rows] = await pool.query("CALL spFindAllInventario();");
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const findInventario = async (req, res) => {
    const id= req.params.id;
    try {
       const [rows] = await pool.query(`CALL spFindInventario(${id});`);
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const insertInventario= async (req, res) => {
    const cantidad = req.body.cantidad;
    const fecha_registro = req.body.fecha_registro;
    const estado = req.body.estado;
    const id_computador = req.body.id_computador;
    const id_herramienta = req.body.id_herramienta;
    const id_ambientes = req.body.id_ambientes
    const id_material = req.body.id_material
 
    try {
       const result = await pool.query(`CALL spInsertInventario('${cantidad}','${fecha_registro}','${estado}','${id_computador}','${id_herramienta}','${id_ambientes}','${id_material}');`);
       res.json(result);
    } catch (error) {
       console.error("Ha ocurrido un error" + error);
    }
 
 };
 export const deleteInventario= async (req, res) => {
    const id = req.params.id;
    try {
       const result = await pool.query(`CALL spDeleteInventario(${id})`);
       if (result[0].affectedRows == 1)
          res.json(result);
       else
          res.json({ "Error": "no lo borro" });
    } catch (error) {
       console.error(error);
 
    }
 
 };
 export const updateInventario = async (req, res) => {
   const id = req.params.id;
   const cantidad = req.body.cantidad;
   const fecha_registro = req.body.fecha_registro;
   const estado = req.body.estado;
   const id_computador = req.body.id_computador;
   const id_herramienta = req.body.id_herramienta;
   const id_ambientes = req.body.id_ambientes
   const id_material = req.body.id_material
 
 
    try {
       const result = await pool.query(`CALL spUpdateInventario(${id},'${cantidad}','${fecha_registro}','${estado}','${id_computador}','${id_herramienta}','${id_ambientes}','${id_material}');`)
       if (result[0].affectedRows != 0)
          res.json(result);
       else
          res.json({ "Error": "NO ACTUALIZO" });
 
    } catch (error) {
       console.error(error);
 
    }
 };