import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:pokedexrr/modelos/jugadores.dart';
import 'package:pokedexrr/utilidades/constantes.dart';




class MongoDB {
  static var bd, coleccionJugadores;

  static conectar() async {
    try {
      bd = await Db.create(CONEXION);
      await bd.open();
      coleccionJugadores = bd.collection(COLECCION);
    } catch (e) {
      if (kDebugMode) {
        print("Error al conectar a MongoDB: $e");
      }
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> getJugadores() async {
    try {
      final jugadores = await coleccionJugadores.find().toList();
      return jugadores;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.value();
    }
  }

  static insertar(Jugador jugador) async {
    await coleccionJugadores.insertAll([jugador.toMap()]);
  }

  static actualizar(Jugador jugador) async {
    var j = await coleccionJugadores.findOne({"_id": jugador.id});
    j["nombre"] = jugador.nombre;
    j["dorsal"] = jugador.dorsal;
    j["equipo"] = jugador.equipo;
    await coleccionJugadores.save(j);
  }

  static eliminar(Jugador jugador) async {
    await coleccionJugadores.remove(where.id(jugador.id));
  }

  static Future<Map<String, dynamic>?> buscarPorNombre(String nombre) async {
    try {
      var jugador = await coleccionJugadores.findOne({"nombre": nombre});

      if (jugador != null) {
        return jugador;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error al buscar jugador por nombre: $e");
      }
      return null;
    }
  }

}