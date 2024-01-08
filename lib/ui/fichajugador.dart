import 'package:flutter/material.dart';
import 'package:pokedexrr/modelos/jugadores.dart';

class FichaJugador extends StatelessWidget {
  FichaJugador({required this.jugador, required this.onTapDelete, required this.onTapEdit});
  final Jugador jugador;
  final VoidCallback onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: Image.asset('assets/images/${jugador.nombre.trim()}.png'), // Asegúrate de que las imágenes estén en la carpeta correcta
        title: Text(jugador.nombre),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(jugador.nombre),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Altura: ${jugador.dorsal}'),
                      Text('Peso: ${jugador.equipo}'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Aceptar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                child: Icon(Icons.edit),
                onTap: onTapEdit
            ),
            GestureDetector(
              child: Icon(Icons.delete),
              onTap: onTapDelete,
            )
          ],
        ),
      ),
    );
  }


}