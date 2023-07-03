import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/computador.controller.js"
const route = Router();

//computadores
route.get("/computador",controller.findAllComputador);
route.get("/computador/:id",controller.findComputador);
route.post("/computador",controller.insertComputador);
route.put("/computador/:id",controller.updateComputador);
route.delete("/computador/:id",controller.deleteComputador);

export default route;