// importamos el paquete color para luego utilizarlo en los entornos
import colors from "colors";


// libreria de colores
const message = (mensaje, tipo) => {
  switch (tipo) {
    case "danger":
      console.log(mensaje.bgRed);
      break;
    case "warning":
      console.log(mensaje.bgYellow);
      break;
    case "success":
      console.log(mensaje.bgGreen);
      break;
    default:
      console.log(mensaje.bgWhite);
      break;
  }
}
export default message;
