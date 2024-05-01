import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get_connect/connect.dart';

import '../models/pokemon/pokemon.dart';
import '../models/region/region.dart';

class ApiPokemonService extends GetConnect {
  Future<Region> getRegionDataByGeneration(int generation) async {
    final data = await DefaultCacheManager()
        .getSingleFile("https://pokeapi.co/api/v2/generation/$generation");
    return Region.fromJson(jsonDecode(await data.readAsString()));
  }

  Future<Pokemon> getPokemonDataByID(int id) async {
    final data = await DefaultCacheManager()
        .getSingleFile("https://pokeapi.co/api/v2/pokemon-species/$id");
    return Pokemon.fromJson(jsonDecode(await data.readAsString()));
  }
}
