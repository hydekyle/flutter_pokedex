import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:get/get.dart';

import '../models/pokemon/pokemon.dart';
import '../models/region/region.dart';

class PokedexController extends GetxController {
  final ApiPokemonService apiService = ApiPokemonService();

  late final Region region;
  final isDataLoaded = false.obs;
  final RxList<Pokemon> pokemonList = RxList<Pokemon>();

  init() async {
    print("START!!!!!");

    await loadRegionData();
    await loadPokemonData();
    isDataLoaded.value = true;

    print("END!!!!!");
  }

  loadRegionData() async {
    region = await apiService.getRegionDataByGeneration(1);
  }

  loadPokemonData() async {
    pokemonList.add(await apiService.getPokemonDataByID(1));
  }
}
