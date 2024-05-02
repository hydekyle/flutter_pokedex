import 'package:flutter_pokedex/models/pokemon_form/pokemon_form.dart';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:get/get.dart';

import '../models/generation/generation.dart';

class PokedexController extends GetxController {
  final ApiPokemonService apiService = ApiPokemonService();
  late final Generation generation;
  final pokemonList = RxList<PokemonForm>();
  final pokemonFilter = "".obs;

  init() async {
    print("START!!!!!");

    await loadRegionData();
    await loadPokemonListData();

    print("END!!!!!");
  }

  loadRegionData() async {
    generation = await apiService.getRegionDataByGeneration(1);
    // Sort Pokemon List by ID since API delivers it unsorted
    generation.pokemonSpecies
        .sort((a, b) => a.getMyID().compareTo(b.getMyID()));
  }

  loadPokemonListData() async {
    for (var x = 0; x < generation.pokemonSpecies.length; x++) {
      pokemonList.add(await apiService
          .getPokemonFormByID(generation.pokemonSpecies[x].getMyID()));
    }
  }
}
