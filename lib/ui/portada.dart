import 'package:flutter/material.dart';
import 'package:pokedexrr/bd/mongodb.dart';
import 'package:pokedexrr/modelos/jugadores.dart';
import 'package:pokedexrr/ui/editar_jugador.dart';

import 'package:pokedexrr/modelos/busqueda_delegate.dart';
import 'fichajugador.dart';

class Portada extends StatefulWidget {
  @override
  _PortadaState createState() => _PortadaState();
}

class _PortadaState extends State<Portada> {
  bool _isSearching = false;
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !_isSearching ? const Text("Pokédex") : null,
        actions: _isSearching
            ? <Widget>[
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                _isSearching = false;
                _searchText = "";
              });
            },
          )
        ]
            : <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = false;
              });
              showSearch(
                context: context,
                delegate: Searchpokemon(),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: MongoDB.getJugadores(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final jugadores = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FichaJugador(
                    jugador: Jugador.fromMap(jugadores[index]),
                    onTapDelete: () async {
                      _eliminarJugador(Jugador.fromMap(jugadores[index]));
                    },
                    onTapEdit: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EditarJugador();
                          },
                          settings: RouteSettings(
                            arguments: Jugador.fromMap(jugadores[index]),
                          ),
                        ),
                      ).then((value) => setState(() {}));
                    },
                  ),
                );
              },
              itemCount: jugadores.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditarJugador()),
          ).then((value) => setState((){}));
        },
        child: const Icon(Icons.add),
      ),




    );
  }

  _eliminarJugador(Jugador jugador) async {
    await MongoDB.eliminar(jugador);
    setState(() {});
  }
}

