import 'package:flutter/material.dart';
import 'package:noticias_app/presentation/providers/pokemon_provider.dart';
import 'package:noticias_app/presentation/widgets/custom_pokemon_widget.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final pokemonProvider = Provider.of<PokemonProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('PokemonApi'),
      ),
      body: CustomPokemonWidget(pokemons: pokemonProvider.pokemonList),
    );
  }
}