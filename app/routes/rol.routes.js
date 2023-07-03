import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/rol.controller.js"
const route = Router();

//rol
route.get("/rol",controller.findAllRol);
route.get("/rol/:id",controller.findRol);
route.post("/rol",controller.insertRol);
route.put("/rol/:id",controller.updateRol);
route.delete("/rol/:id",controller.deleteRol);


export default route;