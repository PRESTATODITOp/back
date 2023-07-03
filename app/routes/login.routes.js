import { Router } from "express"; 

import * as controller from "../controllers/login.controller.js"
const login = Router();

login.post("/consulta",controller.consultUser);

export default login;
