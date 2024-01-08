//import 'package:flutter/material.dart';

//class Pokemon {
  //final String nombre;
  //final String imagenUrl;

  //Pokemon({required this.nombre, required this.imagenUrl});
//}

//class PokemonList extends StatelessWidget {
  //final List<Pokemon> pokemones = [
    //Pokemon(nombre: 'Bulbasaur', imagenUrl: 'assets/images/bulbasaur.png'),
    //Pokemon(nombre: 'Charmander', imagenUrl: 'assets/images/charmander.png'),
    //Pokemon(nombre: 'Squirtle', imagenUrl: 'assets/images/squirtle.png'),

    //Pokemon(nombre: 'Pikachu', imagenUrl: 'assets/images/pikachu.png'),
    //Pokemon(nombre: 'Jigglypuff', imagenUrl: 'assets/images/jigglypuff.png'),
    //Pokemon(nombre: 'Mewtwo', imagenUrl: 'assets/images/mewtwo.png'),
    //Pokemon(nombre: 'Snorlax', imagenUrl: 'assets/images/snorlax.png'),
    //Pokemon(nombre: 'Gengar', imagenUrl: 'assets/images/gengar.png'),
    //Pokemon(nombre: 'Eevee', imagenUrl: 'assets/images/eevee.png'),
    //Pokemon(nombre: 'Dragonite', imagenUrl: 'assets/images/dragonite.png'),

    // Agrega más Pokémon según sea necesario
  //];

  //PokemonList({super.key});

  //@override
  //Widget build(BuildContext context) {
    //return ListView.builder(
      //itemCount: pokemones.length,
      //itemBuilder: (context, index) {
        //return PokemonCard(pokemon: pokemones[index]);
      //},
    //);
  //}
//}

//class PokemonCard extends StatelessWidget {
  //final Pokemon pokemon;

  //const PokemonCard({super.key, required this.pokemon});

  //@override
  //Widget build(BuildContext context) {
    //return Card(
      //margin: const EdgeInsets.all(8.0),
      //child: ListTile(
        //leading: Image.asset(
          //pokemon.imagenUrl,
          //width: 50.0,
          //height: 50.0,
        //),
        //title: Text(pokemon.nombre),
        // Puedes agregar más detalles del Pokémon aquí si es necesario
      //),
    //);
  //}
//}
