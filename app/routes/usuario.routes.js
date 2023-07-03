import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/usuarios.controller.js"
const route = Router();


// mostrar todos los procedimientos de la base de datos 

//usuario
route.get("/usuario",controller.findAllUsuario);
route.get("/usuario/:id",controller.findUsuario);
route.post("/usuario",controller.insertUsuario);
route.put("/usuario/:id",controller.updateUsuario);
route.delete("/usuario/:id",controller.deleteUsuario);


export default route;