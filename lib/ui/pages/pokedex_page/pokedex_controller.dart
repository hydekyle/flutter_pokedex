import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/dto/pokemon/pokemon.dart';
import '../../../models/dto/pokemon_data/pokemon_data.dart';
import '../../../models/dto/pokemon_generation/pokemon_generation.dart';
import '../captured_page/captured_page.dart';

class PokedexController extends GetxController {
  late final PokemonGeneration generation;
  final capturedList = RxList<Pokemon>();
  final pokemonNameFilter = "".obs;
  final isDataLoaded = false.obs;

  init() async {
    print("START!!!!!");

    // Load region data
    generation = await ApiPokemonService.getGenerationDataByID(1);
    // Sort Pokemon List by ID since API delivers it unsorted
    generation.pokemonSpecies.sort((a, b) => a.id.compareTo(b.id));

    // Load saved captured pokemonID list
    await GetStorage.init();
    final box = GetStorage();
    final savedCapturedList = box.read("captured");

    // Parse saved ID data as Pokemon model
    if (savedCapturedList != null) {
      for (var x = 0; x < savedCapturedList.length; x++) {
        final pokemon = generation.pokemonSpecies
            .firstWhere((pokemon) => pokemon.id == savedCapturedList[x]);
        capturedList.add(pokemon);
      }
    }

    isDataLoaded.value = true;
    print("END!!!!!");
  }

  addToCapturedList(int pokemonID) {
    final pokemon = generation.pokemonSpecies
        .firstWhere((pokemon) => pokemon.id == pokemonID);
    capturedList.add(pokemon);
    saveCapturedList();
    Get.to(CapturedPage());
  }

  saveCapturedList() {
    final List<int> pokemonIDList = [];
    for (var x = 0; x < capturedList.length; x++) {
      pokemonIDList.add(capturedList[x].id);
    }
    GetStorage().write("captured", pokemonIDList);
  }

  orderByID() {
    capturedList.sort((a, b) => a.id.compareTo(b.id));
  }

  orderByName() {
    capturedList.sort((a, b) => a.name.compareTo(b.name));
  }

  filterByTypes(List<PokemonType> filteredTypes) async {
    List<PokemonData> pokemonData = [];
    for (var x = 0; x < capturedList.length; x++) {
      pokemonData.add(await capturedList[x].getPokemonData());
    }

    List<PokemonData> filteredData = [];
    filteredData.addAll(pokemonData);
    for (var x = 0; x < filteredTypes.length; x++) {
      filteredData = pokemonData.map((pokemon) => pokemon).toList();
    }

    List<Pokemon> finalFilteredList = [];
    for (var x = 0; x < filteredData.length; x++) {
      finalFilteredList.add(Pokemon.fromJson(filteredData[x].toJson()));
    }

    capturedList.value = finalFilteredList;
  }
}
