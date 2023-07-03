import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/ambientes.controller.js"
const route = Router();

//ambientes
route.get("/ambientes",controller.findAllAmbientes);
route.get("/ambientes/:id",controller.findAmbientes);
route.post("/ambientes",controller.insertAmbientes);
route.put("/ambientes/:id",controller.updateAmbientes);
route.delete("/ambientes/:id",controller.deleteAmbientes);

export default route;