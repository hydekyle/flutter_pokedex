import 'package:flutter_pokedex/models/dto/pokemon/pokemon.dart';
import 'package:flutter_pokedex/models/dto/pokemon_data/pokemon_data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/dto/pokemon_generation/pokemon_generation.dart';
import '../pokedex_page/pokedex_controller.dart';

class CapturedController extends GetxController {
  final PokemonGeneration generation = Get.find<PokedexController>().generation;
  final capturedList = RxList<Pokemon>();
  final filteredCapturedList = RxList<Pokemon>();
  final filterTypeList = RxList<String>();

  List<String> get availableTypeNames =>
      generation.types.map((type) => type.name).toList();

  init() async {
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
  }

  addToCapturedList(int pokemonID) {
    final pokemon = generation.pokemonSpecies
        .firstWhere((pokemon) => pokemon.id == pokemonID);
    capturedList.add(pokemon);
    saveCapturedList();
  }

  deleteFromCapturedList(int pokemonID) {
    capturedList.removeWhere((pokemon) => pokemon.id == pokemonID);
    saveCapturedList();
  }

  saveCapturedList() {
    final List<int> pokemonIDList = [];
    for (var x = 0; x < capturedList.length; x++) {
      pokemonIDList.add(capturedList[x].id);
    }
    GetStorage().write("captured", pokemonIDList);
  }

  orderCapturedListByID() {
    capturedList.sort((a, b) => a.id.compareTo(b.id));
  }

  orderCapturedListByName() {
    capturedList.sort((a, b) => a.name.compareTo(b.name));
  }

  filterCapturedListByTypes() async {
    filteredCapturedList.clear();

    // Get All Pokemon Data to compare types
    List<PokemonData> pokemonData =
        await getPokemonDataListByPokemonList(capturedList);

    // Filter list by each type
    for (var x = 0; x < filterTypeList.length; x++) {
      pokemonData = pokemonData
          .where((pokemon) => pokemon.typeSlots
              .map((element) => element.type.name)
              .toList()
              .contains(filterTypeList[x]))
          .toList();
    }

    print(pokemonData.length);
    for (var x = 0; x < pokemonData.length; x++) {
      filteredCapturedList.add(generation.pokemonSpecies
          .firstWhere((pokemon) => pokemon.id == pokemonData[x].id));
    }
    filteredCapturedList.refresh();
  }

  clearFilterType() => filterTypeList.clear();

  removeFilterType(String typeName) {
    filterTypeList.remove(typeName);
    filterCapturedListByTypes();
  }

  addFilterType(String typeName) {
    filterTypeList.add(typeName);
    filterCapturedListByTypes();
  }

  changeThemeByCaputedList() async {
    List<PokemonData> capturedPokemonDataList =
        await getPokemonDataListByPokemonList(capturedList);

    List<PokemonType> pokemonTypes = [];
    for (var x = 0; x < capturedPokemonDataList.length; x++) {
      for (var y = 0; y < capturedPokemonDataList[x].typeSlots.length; y++) {
        pokemonTypes.add(capturedPokemonDataList[x].typeSlots[y].type);
      }
    }
  }

  Future<List<PokemonData>> getPokemonDataListByPokemonList(
      List<Pokemon> pokemonList) async {
    List<PokemonData> pokemonDataList = [];
    for (var x = 0; x < pokemonList.length; x++) {
      final data = await pokemonList[x].getPokemonData();
      pokemonDataList.add(data);
    }
    return pokemonDataList;
  }
}
