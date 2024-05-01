import 'dart:convert';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:get/get.dart';

import '../models/pokemon/pokemon.dart';

class PokedexController extends GetxController {
  final ApiPokemonService pokeApi = ApiPokemonService();
  final RxList<Pokemon> pokemonList = RxList<Pokemon>();

  init() async {
    print("inicializao");
    await loadPokemonData();
    print("datos leidos");
  }

  loadPokemonData() async {
    final response = await ApiPokemonService().getPokemonData(1);
    final data = jsonEncode(response.body);
    final pokemon = Pokemon.fromJson(jsonDecode(data));
    pokemonList.add(pokemon);
  }
}
