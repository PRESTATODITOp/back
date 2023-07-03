"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");
var _app = _interopRequireDefault(require("./app.js"));
var _index = require("./config/index.js");
//usar la funcion del express
_app["default"].listen(_app["default"].get("PORT"), _index.caseEntorno);