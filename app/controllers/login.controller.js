import { pool } from "../config/database/db";


export const consultUser = async(req, res) => {
   const id_usuario = req.body.id_usuario;
   const contrasena = req.body.contrasena;

   try {
      const result = await pool.query(`CALL spConsultarUsuario(${id_usuario},'${contrasena}');`);
      res.json(result);
   } catch (error) {
      console.error("Ha ocurrido un error" + error);
   }

};