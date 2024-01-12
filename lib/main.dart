import 'package:flutter/material.dart';
import 'package:pokedexrr/bd/mongodb.dart';
import 'package:pokedexrr/ui/portada.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.conectar();

  //SOLO PARA VER QUE FUNCIONA CORRECTAMENTE

  // Llama a la función buscarPorNombre con un nombre específico
  //String nombreABuscar = "charmander";
  //var resultado = await MongoDB.buscarPorNombre(nombreABuscar);

  // Maneja el resultado de la búsqueda
  //if (resultado != null) {
    //print("Jugador encontrado: $resultado");
  //} else {
    //print("Jugador no encontrado.");
  //}

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Portada(),
    );
  }
}
