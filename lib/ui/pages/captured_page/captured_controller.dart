import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/dto/pokemon/pokemon.dart';
import 'package:flutter_pokedex/models/dto/pokemon_data/pokemon_data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/dto/pokemon_generation/pokemon_generation.dart';

class CapturedController extends GetxController {
  final PokemonGeneration generation;
  final capturedList = RxList<Pokemon>();
  final filteredCapturedList = RxList<Pokemon>();
  final filterTypeList = RxList<String>();

  CapturedController({required this.generation});

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

    changeThemeByCaputedList();
    capturedList.listen((p0) => changeThemeByCaputedList());
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
    if (capturedList.isEmpty) return;

    List<PokemonData> capturedPokemonDataList =
        await getPokemonDataListByPokemonList(capturedList);

    HashMap<String, int> totalTypeAmountMap = HashMap<String, int>();

    for (var x = 0; x < capturedPokemonDataList.length; x++) {
      final pokemonTypeSlots = capturedPokemonDataList[x].typeSlots;
      for (var y = 0; y < pokemonTypeSlots.length; y++) {
        final typeName = pokemonTypeSlots[y].type.name;
        if (totalTypeAmountMap[typeName] != null) {
          totalTypeAmountMap[typeName] = totalTypeAmountMap[typeName]! + 1;
        } else {
          totalTypeAmountMap[typeName] = 1;
        }
      }
    }

    final myList = totalTypeAmountMap.entries.toList();
    myList.sort((a, b) => a.value.compareTo(b.value));
    final maxValue = myList.last.value;
    final isMaxValueDraw =
        myList.where((test) => test.value == maxValue).toList().length >= 2;

    if (isMaxValueDraw) {
      Get.changeTheme(getThemeData());
    } else {
      Get.changeTheme(
          getThemeData(themeColor: getColorByPokemonType(myList.last.key)));
    }
  }

  Color getColorByPokemonType(String typeName) {
    switch (typeName) {
      case "normal":
        return Colors.grey;
      case "fighting":
        return Colors.brown.shade700;
      case "flying":
        return Colors.blueGrey;
      case "poison":
        return Colors.deepPurple;
      case "ground":
        return Colors.orange;
      case "rock":
        return Colors.brown;
      case "bug":
        return Colors.pink;
      case "ghost":
        return Colors.deepPurple.shade800;
      case "fire":
        return Colors.red;
      case "water":
        return Colors.blue;
      case "grass":
        return Colors.green;
      case "electric":
        return Colors.amber;
      case "psychic":
        return Colors.pink;
      case "ice":
        return Colors.cyan;
      case "dragon":
        return Colors.purple;
      case _:
        return Colors.deepOrange;
    }
  }

  ThemeData getThemeData({Color? themeColor}) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeColor ?? Colors.deepOrange,
      ),
    );
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
