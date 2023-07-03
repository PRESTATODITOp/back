import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/elementos.controller.js"
const route = Router();

//Elementos
route.get("/elementos",controller.findAllElementos);
route.get("/elementos/:id",controller.findElementos);
route.post("/elementos",controller.insertElementos);
route.put("/elementos/:id",controller.updateElementos);
route.delete("/elementos/:id",controller.deleteElementos);

export default route;