import 'package:flutter_pokedex/models/dto/pokemon_data/pokemon_data.dart';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:get/get.dart';
import '../../../models/dto/pokemon_generation/pokemon_generation.dart';

class PokedexController extends GetxController {
  final ApiPokemonService apiService = ApiPokemonService();
  late final PokemonGeneration generation;
  final pokemonList = RxList<PokemonData>();
  final pokemonFilter = "".obs;

  init() async {
    print("START!!!!!");

    generation = await apiService.getRegionDataByGeneration(1);
    // Sort Pokemon List by ID since API delivers it unsorted
    generation.pokemonSpecies
        .sort((a, b) => a.getMyID().compareTo(b.getMyID()));

    // Load Data for every Pokemon from Generation List
    loadPokemonListByGeneration(generation);

    print("END!!!!!");
  }

  loadPokemonListByGeneration(PokemonGeneration generation) async {
    for (var x = 0; x < generation.pokemonSpecies.length; x++) {
      pokemonList.add(await apiService
          .getPokemonDataByID(generation.pokemonSpecies[x].getMyID()));
    }
  }
}
