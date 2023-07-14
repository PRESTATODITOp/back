"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;
var _express = _interopRequireDefault(require("express"));
var _dotenv = _interopRequireDefault(require("dotenv"));
var _morgan = _interopRequireDefault(require("morgan"));
var _cors = _interopRequireDefault(require("cors"));
var _enviroments = _interopRequireDefault(require("./config/enviroments"));
var _message = _interopRequireDefault(require("./config/message"));
var _ambientes = _interopRequireDefault(require("./routes/ambientes.routes"));
var _computador = _interopRequireDefault(require("./routes/computador.routes"));
var _elementos = _interopRequireDefault(require("./routes/elementos.routes"));
var _herramientas = _interopRequireDefault(require("./routes/herramientas.routes"));
var _inventario = _interopRequireDefault(require("./routes/inventario.routes"));
var _material = _interopRequireDefault(require("./routes/material.routes"));
var _prestamos = _interopRequireDefault(require("./routes/prestamos.routes"));
var _resElem = _interopRequireDefault(require("./routes/resElem.routes"));
var _reserva = _interopRequireDefault(require("./routes/reserva.routes"));
var _rol = _interopRequireDefault(require("./routes/rol.routes"));
var _usuario = _interopRequireDefault(require("./routes/usuario.routes"));
var _login = _interopRequireDefault(require("./routes/login.routes"));
// Rutas de la api

var app = (0, _express["default"])();
app.set("PORT", process.env.PORT);

//middlewares
app.use((0, _cors["default"])());
app.use(_express["default"].json());
app.use(_express["default"].urlencoded({
  extended: false
}));
// app.use(express.urlencoded({extended: false}));
app.use((0, _morgan["default"])('dev'));

//Routes
app.get('/', function (req, res) {
  res.send({
    message: 'Bienvenidos a PrestaTodito'
  });
});
app.use('/api', _ambientes["default"]);
app.use('/api', _computador["default"]);
app.use('/api', _elementos["default"]);
app.use('/api', _herramientas["default"]);
app.use('/api', _inventario["default"]);
app.use('/api', _material["default"]);
app.use('/api', _prestamos["default"]);
app.use('/api', _resElem["default"]);
app.use('/api', _reserva["default"]);
app.use('/api', _rol["default"]);
app.use('/api', _usuario["default"]);
app.use('/api', _login["default"]);
var _default = app;
exports["default"] = _default;