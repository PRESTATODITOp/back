import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/resElem.controller.js"
const route = Router();


// mostrar todos los procedimientos de la base de datos 

//resElem
route.get("/resElem",controller.findAllResElem);
route.get("/resElem/:id",controller.findResElem);
route.post("/resElem",controller.insertResElem);
route.put("/resElem/:id",controller.updateResElem);
route.delete("/resElem/:id",controller.deleteResElem);


export default route;