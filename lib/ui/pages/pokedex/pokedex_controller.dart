import 'package:flutter_pokedex/models/dto/pokemon_data/pokemon_data.dart';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/dto/pokemon_generation/pokemon_generation.dart';

class PokedexController extends GetxController {
  late final PokemonGeneration generation;
  final capturedList = RxList<int>();
  final pokemonNameFilter = "".obs;

  init() async {
    print("START!!!!!");

    // Load saved captured list
    await GetStorage.init();
    final box = GetStorage();
    final savedCapturedList = box.read("captured");
    if (savedCapturedList != null) capturedList.value = savedCapturedList;

    // Load region data
    generation = await ApiPokemonService.getGenerationDataByID(1);
    // Sort Pokemon List by ID since API delivers it unsorted
    generation.pokemonSpecies.sort((a, b) => a.id.compareTo(b.id));

    print("END!!!!!");
  }

  addToCapturedList(int pokemonID) {
    capturedList.add(pokemonID);
    saveCapturedList();
  }

  saveCapturedList() {
    GetStorage().write("captured", capturedList.toList());
  }
}
