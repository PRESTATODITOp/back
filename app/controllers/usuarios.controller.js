//  importamos la base de datos para hacer la consulta
import { pool } from "../config/database/db";


// ejecucion de procedimientos almacenados

//Usuario
export const findAllUsuario= async (req, res) => {

   try {
      const [rows] = await pool.query("CALL spFindAllUsuario();");
      res.json(rows);
   } catch (error) {
      console.error("Ha ocurrido un errorcito" + error);

   }
};

export const findUsuario= async (req, res) => {
   const id = req.params.id;
   try {
      const [rows] = await pool.query(`CALL spFindUsuario(${id});`);
      res.json(rows);
   } catch (error) {
      console.error("Ha ocurrido un error" + error);

   }
};
export const insertUsuario= async (req, res) => {
   const id = req.body.id;
   const nombre = req.body.nombre;
   const apellido = req.body.apellido;
   const tipo_documento = req.body.tipo_documento;
   const correo = req.body.correo;
   const telefono = req.body.telefono;
   const direccion = req.body.direccion;
   const jornada = req.body.jornada;
   const programa_formacion = req.body.programa_formacion;
   const numero_ficha = req.body.numero_ficha;
   const genero = req.body.genero;
   const contrasena = req.body.contrasena;
   const id_rol = req.body.id_rol;


   try {
      const result = await pool.query(`CALL spInsertUsuario('${id}','${nombre}','${apellido}','${tipo_documento}',
       '${correo}','${telefono}','${direccion}','${jornada}','${programa_formacion}','${numero_ficha}','${genero}','${contrasena}','${id_rol}');`);
      res.json(result);
   } catch (error) {
      console.error("Ha ocurrido un error" + error);
   }

};
export const deleteUsuario= async (req, res) => {
   const id = req.params.id;
   try {
      const result = await pool.query(`CALL spDeleteUsuario(${id})`);
      if (result[0].affectedRows == 1)
         res.json(result);
      else
         res.json({ "Error": "no lo borro" });
   } catch (error) {
      console.error(error);

   }

};

export const updateUsuario= async (req, res) => {
   const id = req.params.id
   const nombre = req.body.nombre;
   const apellido = req.body.apellido;
   const tipo_documento = req.body.tipo_documento;
   const correo = req.body.correo;
   const telefono = req.body.telefono;
   const direccion = req.body.direccion;
   const jornada = req.body.jornada;
   const programa_formacion = req.body.programa_formacion;
   const numero_ficha = req.body.numero_ficha;
   const genero = req.body.genero;
   const contrasena = req.body.contrasena;
   const id_rol = req.body.id_rol;

   try {
      const result = await pool.query(`CALL spUpdateUsuario('${id}','${nombre}','${apellido}','${tipo_documento}',
       '${correo}','${telefono}','${direccion}','${jornada}','${programa_formacion}','${numero_ficha}','${genero}','${contrasena}','${id_rol}');`);
      if (result[0].affectedRows != 0)
         res.json(result);
      else
         res.json({ "Error": "NO ACTUALIZO" });

   } catch (error) {
      console.error(error);

   }
};