//  importamos la base de datos para hacer la consulta
import { pool } from "../config/database/db";


// ejecucion de procedimientos almacenados

//Elementos
export const findAllElementos= async (req, res) => {

   try {
      const [rows] = await pool.query("CALL spFindAllElementos();");
      res.json(rows);
   } catch (error) {
      console.error("Ha ocurrido un error");

   }
};

export const findElementos= async (req, res) => {
   const id = req.params.id;
   try {
      const [rows] = await pool.query(`CALL spFindElementos(${id});`);
      res.json(rows);
   } catch (error) {
      console.error("Ha ocurrido un error");

   }
};
export const insertElementos= async (req, res) => {
  
  
   const id_prestamos = req.body.id_prestamos;
   const id_inventario = req.body.id_inventario;



   try {
      const result = await pool.query(`CALL spInsertElementos('${id_prestamos}','${id_inventario}');`);
      res.json(result);
   } catch (error) {
      console.error("Ha ocurrido un error" + error);
   }

};
export const deleteElementos= async (req, res) => {
   const id = req.params.id;
   try {
      const result = await pool.query(`CALL spDeleteElementos(${id})`);
      if (result[0].affectedRows == 1)
         res.json(result);
      else
         res.json({ "Error": "no lo borro" });
   } catch (error) {
      console.error(error);

   }

};

export const updateElementos= async (req, res) => {
   const id = req.params.id
   const id_prestamos = req.body.id_prestamos;
   const id_inventario = req.body.id_inventario;


   try {
      const result = await pool.query(`CALL spUpdateElementos('${id}','${id_prestamos}','${id_inventario}');`);
      if (result[0].affectedRows != 0)
         res.json(result);
      else
         res.json({ "Error": "NO ACTUALIZO" });

   } catch (error) {
      console.error(error);

   }
};