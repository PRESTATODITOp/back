//  importamos la base de datos para hacer la consulta
import { pool } from "../config/database/db";


// ejecucion de procedimientos almacenados

//Prestamo
export const findAllPrestamos= async (req, res) => {

   try {
      const [rows] = await pool.query("CALL spFindAllPrestamos();");
      res.json(rows);
   } catch (error) {
      console.error("Ha ocurrido un error11");

   }
};

export const findPrestamos= async (req, res) => {
   const id = req.params.id;
   try {
      const [rows] = await pool.query(`CALL spFindPrestamos(${id});`);
      res.json(rows);
   } catch (error) {
      console.error("Ha ocurrido un error12");

   }
};
export const insertPrestamos= async (req, res) => {
  
   const observaciones = req.body.observaciones;
   const id_usuario = req.body.id_usuario;
   const estado = req.body.estado;




   try {
      const result = await pool.query(`CALL spInsertPrestamos('${observaciones}','${id_usuario}' ,'${estado}');`);
      res.json(result);
   } catch (error) {
      console.error("Ha ocurrido un error14" + error);
   }

};
export const deletePrestamos= async (req, res) => {
   const id = req.params.id;
   try {
      const result = await pool.query(`CALL spDeletePrestamos(${id})`);
      if (result[0].affectedRows == 1)
         res.json(result);
      else
         res.json({ "Error": "no lo borro" });
   } catch (error) {
      console.error(error);

   }

};

export const updatePrestamos= async (req, res) => {
   const id = req.params.id
   const observaciones = req.body.observaciones;
   const id_usuario = req.body.id_usuario;
   const estado = req.body.estado;


   try {
      const result = await pool.query(`CALL spUpdatePrestamos(${id},'${observaciones}','${id_usuario}' ,'${estado}');`);
      if (result[0].affectedRows != 0)
         res.json(result);
      else
         res.json({ "Error": "NO ACTUALIZO" });

   } catch (error) {
      console.error(error);

   }
};


export const updateDevolucion = async (req, res) => {
   const id = req.params.id;
   const estado= req.body.estado;

   try {
      const result = await pool.query(`CALL spUpdateDevolucion(${id},'${estado}');`)
      if (result[0].affectedRows != 0)
         res.json(result);
      else
         res.json({ "Error": "NO ACTUALIZO EL ESTADO" });

   } catch (error) {
      console.error(error);

   }
};