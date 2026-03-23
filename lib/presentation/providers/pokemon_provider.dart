import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:noticias_app/models/list_pokemon_model.dart';
import 'package:noticias_app/models/pokemon_model.dart';

String url = "https://pokeapi.co/api/v2/pokemon";

class PokemonProvider extends ChangeNotifier {
  List<ListResultModel> pokemonList = [];
  bool isLoading = false;

  PokemonProvider() {
    getPokemon();
  }

  Future<void> getPokemon() async {
    isLoading = true;
    notifyListeners();
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = listPokemonModelFromJson(
          const Utf8Decoder().convert(response.bodyBytes),
        );
        pokemonList = data.results;
        notifyListeners();
      }
      else{
        pokemonList = [];
      }
    } catch (e) {
      pokemonList = [];
    }
  }
  // Future<PokemonModel> getPokemonByUrl(String url) async {
  // final response = await http.get(Uri.parse(url));
  // final data = jsonDecode(response.body);

  // return PokemonModel.fromJson(data);
// }
}
