import 'package:flutter/material.dart';
import '../bd/mongodb.dart';
//import '../ui/editar_jugador.dart';
import '../ui/fichajugador.dart';
import 'jugadores.dart';

class Searchpokemon extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: MongoDB.buscarPorNombre(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final jugador = snapshot.data;
          if (jugador != null) {
            return FichaJugador(
              jugador: Jugador.fromMap(jugador),
              onTapDelete: () {
                _eliminarJugador(Jugador.fromMap(jugador));
              },
              onTapEdit: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => EditarJugador()));
              },
            );
          } else {
            return const Text('Jugador no encontrado');
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('Buscando Pokémon');
  }

  void _eliminarJugador(Jugador jugador) async {
    await MongoDB.eliminar(jugador);
  }
}
