"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.consultUser = void 0;
var _regenerator = _interopRequireDefault(require("@babel/runtime/regenerator"));
var _asyncToGenerator2 = _interopRequireDefault(require("@babel/runtime/helpers/asyncToGenerator"));
var _db = require("../config/database/db");
var consultUser = /*#__PURE__*/function () {
  var _ref = (0, _asyncToGenerator2["default"])( /*#__PURE__*/_regenerator["default"].mark(function _callee(req, res) {
    var id_usuario, contrasena, result;
    return _regenerator["default"].wrap(function _callee$(_context) {
      while (1) switch (_context.prev = _context.next) {
        case 0:
          id_usuario = req.body.id_usuario;
          contrasena = req.body.contrasena;
          _context.prev = 2;
          _context.next = 5;
          return _db.pool.query("CALL spConsultarUsuario(".concat(id_usuario, ",'").concat(contrasena, "');"));
        case 5:
          result = _context.sent;
          res.json(result);
          _context.next = 12;
          break;
        case 9:
          _context.prev = 9;
          _context.t0 = _context["catch"](2);
          console.error("Ha ocurrido un error" + _context.t0);
        case 12:
        case "end":
          return _context.stop();
      }
    }, _callee, null, [[2, 9]]);
  }));
  return function consultUser(_x, _x2) {
    return _ref.apply(this, arguments);
  };
}();
exports.consultUser = consultUser;