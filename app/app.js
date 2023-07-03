import express  from "express";
import dotenv from "dotenv";
import morgan from "morgan";
import cors from "cors";
import enviroments from "./config/enviroments";
import message from "./config/message";

// Rutas de la api

import ambientesRoutes from "./routes/ambientes.routes";
import computadorRoutes from "./routes/computador.routes";
import elementosRoutes from "./routes/elementos.routes"
import herramientasRoutes from "./routes/herramientas.routes";
import inventarioRoutes from "./routes/inventario.routes"
import materialRoutes from "./routes/material.routes";
import prestamosRoutes from "./routes/prestamos.routes";
import resElemRoutes from "./routes/resElem.routes";
import reservaRoutes from "./routes/reserva.routes"
import rolRoutes from "./routes/rol.routes";
import usuarioRoutes from "./routes/usuario.routes";
import loginRoutes from "./routes/login.routes";
import NotisRoutes from "./routes/notificaciones.routes";

const app = express();

app.set("PORT", process.env.PORT);

//middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended:false}));
// app.use(express.urlencoded({extended: false}));
app.use(morgan('dev'));

//Routes
app.get('/',(req, res) =>{
    res.send({ message:'Bienvenidos a PrestaTodito'});
});


app.use('/api', ambientesRoutes);
app.use('/api', computadorRoutes);
app.use('/api', elementosRoutes);
app.use('/api', herramientasRoutes);
app.use('/api', inventarioRoutes);
app.use('/api', materialRoutes);
app.use('/api', prestamosRoutes);
app.use('/api', resElemRoutes);
app.use('/api', reservaRoutes);
app.use('/api', rolRoutes);
app.use('/api',usuarioRoutes);
app.use('/api',loginRoutes);
app.use('/api',NotisRoutes);


export default app;
