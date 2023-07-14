"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.pool = void 0;
var _promise = require("mysql2/promise");
// funcion que perite hacer la conexion a bd

var pool = (0, _promise.createPool)({
  // parametros para hacer la conexion,tiene un orden || VARIABLES 
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME
});
exports.pool = pool;