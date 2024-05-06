import 'dart:collection';
import 'dart:convert';
import 'package:flutter_pokedex/models/dto/pokemon/pokemon.dart';
import 'package:flutter_pokedex/models/dto/pokemon_data/pokemon_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/dto/pokemon_generation/pokemon_generation.dart';
import '../../theme/theme.dart';

/// Handles the list of captured pokemons, it's only used from captured_page.dart,
/// but it could be used from anywhere since we use Get.put() in main.dart
class CapturedController extends GetxController {
  final PokemonGeneration generation;
  final capturedList = RxList<Pokemon>();
  final filteredCapturedList = RxList<Pokemon>();
  final filterTypeList = RxList<String>();
  late final SharedPreferences sharedPrefs;

  CapturedController(this.generation);

  /// Returns a list with all Pokemon Types names sorted by name
  List<String> get availableTypeNames =>
      generation.types.map((type) => type.name).toList()
        ..sort((a, b) => a.compareTo(b));

  init() async {
    sharedPrefs = await SharedPreferences.getInstance();

    // Load saved captured pokemonID list
    final capturedData = sharedPrefs.getString("captured");
    if (capturedData != null) {
      final List<dynamic> savedCapturedList = jsonDecode(capturedData);
      for (var x = 0; x < savedCapturedList.length; x++) {
        final pokemon = generation.pokemonSpecies
            .firstWhere((pokemon) => pokemon.id == savedCapturedList[x] as int);
        capturedList.add(pokemon);
      }
      _changeThemeByCapturedList();
    }

    // Listen for changes in captured pokemon list to change theme accordingly
    capturedList.listen((p0) => _changeThemeByCapturedList);
  }

  /// Add a pokemon to the list and save it to disk
  addToCapturedList(int pokemonID) {
    final pokemon = generation.pokemonSpecies
        .firstWhere((pokemon) => pokemon.id == pokemonID);
    capturedList.add(pokemon);
    _saveCapturedList();
    _changeThemeByCapturedList();
  }

  /// Remove a pokemon to the list and save it to disk
  deleteFromCapturedList(int pokemonID) {
    capturedList.removeWhere((pokemon) => pokemon.id == pokemonID);
    filteredCapturedList.removeWhere((pokemon) => pokemon.id == pokemonID);
    _saveCapturedList();
    _changeThemeByCapturedList();
  }

  /// Save to disk all Pokemon data as a List of int (pokemon.id)
  _saveCapturedList() {
    final List<int> pokemonIDList = [];
    for (var x = 0; x < capturedList.length; x++) {
      pokemonIDList.add(capturedList[x].id);
    }
    print("added ${pokemonIDList.length}");
    print(jsonEncode(pokemonIDList));
    sharedPrefs.setString("captured", jsonEncode(pokemonIDList));
  }

  /// Check if a pokemonID is in the captured list
  bool isPokemonCaptured(int pokemonID) =>
      capturedList.firstWhereOrNull((element) => element.id == pokemonID) !=
      null;

  /// Sort list by pokemon.id, from lowest to highest
  orderCapturedListByID() {
    capturedList.sort((a, b) => a.id.compareTo(b.id));
  }

  /// Sort list by pokemon.name alphabetically
  orderCapturedListByName() {
    if (filterTypeList.isNotEmpty) {
      filteredCapturedList.sort((a, b) => a.name.compareTo(b.name));
    } else {
      capturedList.sort((a, b) => a.name.compareTo(b.name));
    }
  }

  /// Apply Pokemon Type filter by input user filters (filterTypeList)
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

    for (var x = 0; x < pokemonData.length; x++) {
      filteredCapturedList.add(generation.pokemonSpecies
          .firstWhere((pokemon) => pokemon.id == pokemonData[x].id));
    }

    filteredCapturedList.refresh();
  }

  /// Remove a filter from filterTypeList and update filtered Pokemon List
  removeFilterType(String typeName) {
    filterTypeList.remove(typeName);
    filterCapturedListByTypes();
  }

  /// Add a filter from filterTypeList and update filtered Pokemon List
  addFilterType(String typeName) {
    filterTypeList.add(typeName);
    filterCapturedListByTypes();
  }

  /// Change Theme colors by checking the most repeated Pokemon Type
  _changeThemeByCapturedList() async {
    // If there are no pokemon in the list, we avoid calculations and just set the default theme
    if (capturedList.isEmpty) {
      Get.changeTheme(ThemePokemon.getThemeDataByColor(null));
      return;
    }

    // Gets a list of PokemonData to have access to Pokemon Types
    List<PokemonData> capturedPokemonDataList =
        await getPokemonDataListByPokemonList(capturedList);

    // Creates a HashMap to hold how many times each Pokemon Type as appeared
    HashMap<String, int> totalTypeAmountMap = HashMap<String, int>();

    // Iterate over all Pokemon Types and count it using the HashMap
    for (var x = 0; x < capturedPokemonDataList.length; x++) {
      final pokemonTypeSlots = capturedPokemonDataList[x].typeSlots;
      for (var y = 0; y < pokemonTypeSlots.length; y++) {
        final typeName = pokemonTypeSlots[y].type.name;
        // Add +1 or start as 1 if typeName doesn't exists in the HasMap yet
        if (totalTypeAmountMap[typeName] != null) {
          totalTypeAmountMap[typeName] = totalTypeAmountMap[typeName]! + 1;
        } else {
          totalTypeAmountMap[typeName] = 1;
        }
      }
    }

    // Obtain the most picked Pokemon Type among the HashMap values
    final typesOrderByAmount = totalTypeAmountMap.entries.toList();
    typesOrderByAmount.sort((a, b) => a.value.compareTo(b.value));
    final maxValue = typesOrderByAmount.last.value;

    // Check if the highest value is tied with another one
    final isMaxValueDraw = typesOrderByAmount
            .where((test) => test.value == maxValue)
            .toList()
            .length >=
        2;

    // We set default theme if there is no winner among all picked Pokemon types
    if (isMaxValueDraw) {
      Get.changeTheme(ThemePokemon.getThemeDataByColor(null));
    } else {
      final color =
          ThemePokemon.getColorByPokemonType(typesOrderByAmount.last.key);
      Get.changeTheme(ThemePokemon.getThemeDataByColor(color));
    }
  }

  /// Return a List of PokemonData by a given List of Pokemon
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
