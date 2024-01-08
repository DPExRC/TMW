import 'package:flutter/material.dart';

import 'jugadores.dart';

class JugadorSearch extends SearchDelegate<Jugador> {
  final List<Jugador> jugadores;

  JugadorSearch(this.jugadores);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    final results = jugadores.where((jugador) => jugador.nombre.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: results.map<Widget>((jugador) => ListTile(
        title: Text(jugador.nombre),
        onTap: () {
          close(context, jugador);
        },
      )).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = jugadores.where((jugador) => jugador.nombre.toLowerCase().startsWith(query.toLowerCase()));

    return ListView(
      children: suggestions.map<Widget>((jugador) => ListTile(
        title: Text(jugador.nombre),
        onTap: () {
          query = jugador.nombre;
          showResults(context);
        },
      )).toList(),
    );
  }
}
