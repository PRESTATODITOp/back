//  importamos la base de datos para hacer la consulta
import { pool } from "../config/database/db";

//Prestamo Computadoras

export const findAllComputador = async (req, res) => {

    try {
       const [rows] = await pool.query("CALL spFindAllComputador();");
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const findComputador = async (req, res) => {
    const id = req.params.id;
    try {
       const [rows] = await pool.query(`CALL spFindComputador(${id});`);
       res.json(rows);
    } catch (error) {
       console.error("Ha ocurrido un error");
 
    }
 };
 export const insertComputador = async (req, res) => {
    const marca = req.body.marca;
    const cargador = req.body.cargador;
    const mouse = req.body.mouse;
    try {
       const result = await pool.query(`CALL spInsertComputador('${marca}','${cargador}','${mouse}');`);
       res.json(result);
    } catch (error) {
       console.error("Ha ocurrido un error" + error);
    }
 
 };
 export const deleteComputador = async (req, res) => {
    const id = req.params.id;
    try {
       const result = await pool.query(`CALL spDeleteComputador(${id})`);
       if (result[0].affectedRows == 1)
          res.json(result);
       else
          res.json({ "Error": "no lo borro"});
    } catch (error) {
       console.error(error);
 
    }
 
 };
 export const updateComputador = async (req, res) => {
 
    const id = req.params.id;
    const marca = req.body.marca;
    const cargador = req.body.cargador;
    const mouse = req.body.mouse;
 
 
    try {
       const result = await pool.query(`CALL spUpdateComputador('${id}','${marca}','${cargador}','${mouse}');`)
       if (result[0].affectedRows != 0)
          res.json(result);
       else
          res.json({ "Error": "NO ACTUALIZO" });
 
    } catch (error) {
       console.error(error);
 
    }
 };