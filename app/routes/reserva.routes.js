import { Router } from "express"; 
// ENVIAR ARCHIVOS O PARAMETROS DE OTRA PAGINA DESDE EL SERVIDOR

// importamos los procedimientos
import * as controller from "../controllers/reserva.controller.js"
const route = Router();

//reserva
route.get("/reserva",controller.findAllReserva);
route.get("/reserva/:id",controller.findReserva);
route.post("/reserva",controller.insertReserva);
route.post("/insumosReserva",controller.InsumosReserva);
route.put("/reserva/:id",controller.updateReserva);
route.delete("/reserva/:id",controller.deleteReserva);

route.put("/estado/:id",controller.updateEstado);

export default route;