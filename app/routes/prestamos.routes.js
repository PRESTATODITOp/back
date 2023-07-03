import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/prestamos.controller.js"
const route = Router();


// mostrar todos los procedimientos de la base de datos 

//prestamos
route.get("/prestamos",controller.findAllPrestamos);
route.get("/prestamos/:id",controller.findPrestamos);
route.post("/prestamos",controller.insertPrestamos);
route.put("/prestamos/:id",controller.updatePrestamos);
route.delete("/prestamos/:id",controller.deletePrestamos);


export default route;