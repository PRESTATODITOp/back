"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.updatePrestamos = exports.insertPrestamos = exports.findPrestamos = exports.findAllPrestamos = exports.deletePrestamos = void 0;
var _regenerator = _interopRequireDefault(require("@babel/runtime/regenerator"));
var _slicedToArray2 = _interopRequireDefault(require("@babel/runtime/helpers/slicedToArray"));
var _asyncToGenerator2 = _interopRequireDefault(require("@babel/runtime/helpers/asyncToGenerator"));
var _db = require("../config/database/db");
//  importamos la base de datos para hacer la consulta

// ejecucion de procedimientos almacenados

//Prestamo
var findAllPrestamos = /*#__PURE__*/function () {
  var _ref = (0, _asyncToGenerator2["default"])( /*#__PURE__*/_regenerator["default"].mark(function _callee(req, res) {
    var _yield$pool$query, _yield$pool$query2, rows;
    return _regenerator["default"].wrap(function _callee$(_context) {
      while (1) switch (_context.prev = _context.next) {
        case 0:
          _context.prev = 0;
          _context.next = 3;
          return _db.pool.query("CALL spFindAllPrestamos();");
        case 3:
          _yield$pool$query = _context.sent;
          _yield$pool$query2 = (0, _slicedToArray2["default"])(_yield$pool$query, 1);
          rows = _yield$pool$query2[0];
          res.json(rows);
          _context.next = 12;
          break;
        case 9:
          _context.prev = 9;
          _context.t0 = _context["catch"](0);
          console.error("Ha ocurrido un error");
        case 12:
        case "end":
          return _context.stop();
      }
    }, _callee, null, [[0, 9]]);
  }));
  return function findAllPrestamos(_x, _x2) {
    return _ref.apply(this, arguments);
  };
}();
exports.findAllPrestamos = findAllPrestamos;
var findPrestamos = /*#__PURE__*/function () {
  var _ref2 = (0, _asyncToGenerator2["default"])( /*#__PURE__*/_regenerator["default"].mark(function _callee2(req, res) {
    var id, _yield$pool$query3, _yield$pool$query4, rows;
    return _regenerator["default"].wrap(function _callee2$(_context2) {
      while (1) switch (_context2.prev = _context2.next) {
        case 0:
          id = req.params.id;
          _context2.prev = 1;
          _context2.next = 4;
          return _db.pool.query("CALL spFindPrestamos(".concat(id, ");"));
        case 4:
          _yield$pool$query3 = _context2.sent;
          _yield$pool$query4 = (0, _slicedToArray2["default"])(_yield$pool$query3, 1);
          rows = _yield$pool$query4[0];
          res.json(rows);
          _context2.next = 13;
          break;
        case 10:
          _context2.prev = 10;
          _context2.t0 = _context2["catch"](1);
          console.error("Ha ocurrido un error");
        case 13:
        case "end":
          return _context2.stop();
      }
    }, _callee2, null, [[1, 10]]);
  }));
  return function findPrestamos(_x3, _x4) {
    return _ref2.apply(this, arguments);
  };
}();
exports.findPrestamos = findPrestamos;
var insertPrestamos = /*#__PURE__*/function () {
  var _ref3 = (0, _asyncToGenerator2["default"])( /*#__PURE__*/_regenerator["default"].mark(function _callee3(req, res) {
    var fechaPrestamo, final_prestamo, observaciones, id_usuario, result;
    return _regenerator["default"].wrap(function _callee3$(_context3) {
      while (1) switch (_context3.prev = _context3.next) {
        case 0:
          fechaPrestamo = req.body.fechaPrestamo;
          final_prestamo = req.body.final_prestamo;
          observaciones = req.body.observaciones;
          id_usuario = req.body.id_usuario;
          _context3.prev = 4;
          _context3.next = 7;
          return _db.pool.query("CALL spInsertPrestamos('".concat(fechaPrestamo, "','").concat(final_prestamo, "','").concat(observaciones, "',\n       '").concat(id_usuario, "');"));
        case 7:
          result = _context3.sent;
          res.json(result);
          _context3.next = 14;
          break;
        case 11:
          _context3.prev = 11;
          _context3.t0 = _context3["catch"](4);
          console.error("Ha ocurrido un error" + _context3.t0);
        case 14:
        case "end":
          return _context3.stop();
      }
    }, _callee3, null, [[4, 11]]);
  }));
  return function insertPrestamos(_x5, _x6) {
    return _ref3.apply(this, arguments);
  };
}();
exports.insertPrestamos = insertPrestamos;
var deletePrestamos = /*#__PURE__*/function () {
  var _ref4 = (0, _asyncToGenerator2["default"])( /*#__PURE__*/_regenerator["default"].mark(function _callee4(req, res) {
    var id, result;
    return _regenerator["default"].wrap(function _callee4$(_context4) {
      while (1) switch (_context4.prev = _context4.next) {
        case 0:
          id = req.params.id;
          _context4.prev = 1;
          _context4.next = 4;
          return _db.pool.query("CALL spDeletePrestamos(".concat(id, ")"));
        case 4:
          result = _context4.sent;
          if (result[0].affectedRows == 1) res.json(result);else res.json({
            "Error": "no lo borro"
          });
          _context4.next = 11;
          break;
        case 8:
          _context4.prev = 8;
          _context4.t0 = _context4["catch"](1);
          console.error(_context4.t0);
        case 11:
        case "end":
          return _context4.stop();
      }
    }, _callee4, null, [[1, 8]]);
  }));
  return function deletePrestamos(_x7, _x8) {
    return _ref4.apply(this, arguments);
  };
}();
exports.deletePrestamos = deletePrestamos;
var updatePrestamos = /*#__PURE__*/function () {
  var _ref5 = (0, _asyncToGenerator2["default"])( /*#__PURE__*/_regenerator["default"].mark(function _callee5(req, res) {
    var id, fechaPrestamo, final_prestamo, observaciones, id_usuario, result;
    return _regenerator["default"].wrap(function _callee5$(_context5) {
      while (1) switch (_context5.prev = _context5.next) {
        case 0:
          id = req.params.id;
          fechaPrestamo = req.body.fechaPrestamo;
          final_prestamo = req.body.final_prestamo;
          observaciones = req.body.observaciones;
          id_usuario = req.body.id_usuario;
          _context5.prev = 5;
          _context5.next = 8;
          return _db.pool.query("CALL spUpdatePrestamos('".concat(id, "','").concat(fechaPrestamo, "','").concat(final_prestamo, "','").concat(observaciones, "',\n       '").concat(id_usuario, "');"));
        case 8:
          result = _context5.sent;
          if (result[0].affectedRows != 0) res.json(result);else res.json({
            "Error": "NO ACTUALIZO"
          });
          _context5.next = 15;
          break;
        case 12:
          _context5.prev = 12;
          _context5.t0 = _context5["catch"](5);
          console.error(_context5.t0);
        case 15:
        case "end":
          return _context5.stop();
      }
    }, _callee5, null, [[5, 12]]);
  }));
  return function updatePrestamos(_x9, _x10) {
    return _ref5.apply(this, arguments);
  };
}();
exports.updatePrestamos = updatePrestamos;