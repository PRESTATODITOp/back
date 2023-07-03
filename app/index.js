import app from "./app.js";
import { caseEntorno } from "./config/index.js";

//usar la funcion del express
app.listen(app.get("PORT"),caseEntorno);