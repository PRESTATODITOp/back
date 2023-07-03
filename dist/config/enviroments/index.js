"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");
var _path = _interopRequireDefault(require("path"));
var _dotenv = _interopRequireDefault(require("dotenv"));
//direccionar al entorno en el cual queremos estar

_dotenv["default"].config({
  "path": _path["default"].resolve(__dirname, "".concat(process.env.NODE_ENV, ".env"))
});

// hace redireccionamiento dependiendo de como se ejecute la orden dependiendo del ambiente