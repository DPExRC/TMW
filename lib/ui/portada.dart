import 'package:flutter/material.dart';
import 'package:pokedexrr/bd/mongodb.dart';
import 'package:pokedexrr/modelos/jugadores.dart';
import 'package:pokedexrr/ui/editar_jugador.dart';

import '../modelos/busqueda_delegate.dart';
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
    return FutureBuilder(
      future: MongoDB.getJugadores(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
              )
          );
        } else if (snapshot.hasError) {
          return Container(
              color: Colors.white,
              child: Center(
                  child: Text("Lo sentimos, hubo un error",
                    style: Theme.of(context).textTheme.titleLarge,)
              )
          );
        }
        else{
          return Scaffold(
            appBar: AppBar(
              title: !_isSearching ? Text("Pokédek") : null,
              actions: _isSearching ? <Widget>[
                IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this._isSearching = false;
                      _searchText = "";
                    });
                  },
                )
              ] : <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final jugadores = await MongoDB.getJugadores();
                    final selected = await showSearch(
                      context: context,
                      delegate: JugadorSearch(jugadores.cast<Jugador>()),
                    );

                    if (selected != null) {
                      // Haz algo con el jugador seleccionado
                    }
                  },
                )
              ],
            ),

            body: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FichaJugador(
                        jugador : Jugador.fromMap(snapshot.data[index]),
                        onTapDelete: () async {
                          _eliminarJugador(Jugador.fromMap(snapshot.data[index]));
                        },
                        onTapEdit: () async{
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (BuildContext context){
                                    return EditarJugador();
                                  },
                                  settings: RouteSettings(
                                    arguments: Jugador.fromMap(snapshot.data[index]),
                                  )
                              )).then((value)=>setState(() {}));
                        }
                    )
                );
              },
              itemCount: snapshot.data.length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return EditarJugador();
                })).then((value) => setState(() {}));
              },
              child: Icon(Icons.add),
            ),
          );
        }
      },
    );
  }

  _eliminarJugador(Jugador jugador) async {
    await MongoDB.eliminar(jugador);
    setState(() {   });
  }
}
