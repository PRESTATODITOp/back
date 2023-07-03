//direccionar al entorno en el cual queremos estar
import path from "path";
import dotenv from "dotenv";

dotenv.config(
    {
"path":path.resolve(__dirname,`${process.env.NODE_ENV}.env`)
    })
    

    // hace redireccionamiento dependiendo de como se ejecute la orden dependiendo del ambiente