import 'package:flutter/material.dart';
import 'package:noticias_app/models/list_pokemon_model.dart';

class CustomPokemonWidget extends StatelessWidget {
  const CustomPokemonWidget({super.key, required this.pokemons});

  final List<ListResultModel> pokemons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (BuildContext context, int index) {
          final pokemon = pokemons[index];
          return Container(
            height: 20,
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(children: [Row(
              children: [
                Text(pokemon.name),
              ],
            )]),
          );
        },
      ),
    );
  }
}
