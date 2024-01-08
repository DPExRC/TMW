import 'package:flutter/material.dart';
import 'pokemon_screen.dart';
import 'package:pokedexrr/bd/mongodb.dart';
import 'package:pokedexrr/ui/portada.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.conectar();
  runApp(Myapp());
 // runApp(const PokemonScreen());
}

class Myapp extends StatelessWidget{

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
