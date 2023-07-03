import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/notificaciones.controller.js"
const route = Router();

//notificacioneses
route.get("/notificacion",controller.findAllNotificaion);
route.get("/notificacion/:id",controller.findNotificaion);
route.post("/notificacion",controller.insertNotificaion);
route.put("/notificacion/:id",controller.updateNotificaion);
route.delete("/notificacion/:id",controller.deleteNotificaion);

export default route;