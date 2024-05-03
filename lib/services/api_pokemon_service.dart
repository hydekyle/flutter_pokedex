import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pokedex/models/pokemon_data/pokemon_data.dart';
import '../models/pokemon_generation/pokemon_generation.dart';

class ApiPokemonService {
  // Singleton instance
  static final ApiPokemonService _singleton = ApiPokemonService._internal();

  factory ApiPokemonService() {
    return _singleton;
  }
  ApiPokemonService._internal();

  // API endpoints
  Future<PokemonGeneration> getRegionDataByGeneration(int generation) async {
    return PokemonGeneration.fromJson(await _getDataFromEndpoint(
        "https://pokeapi.co/api/v2/generation/$generation"));
  }

  Future<PokemonData> getPokemonDataByID(int id) async {
    return PokemonData.fromJson(
        await _getDataFromEndpoint("https://pokeapi.co/api/v2/pokemon/$id"));
  }

  Widget getPokemonImageByID(int pokemonID) => getImageFromEndpoint(
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonID.png");

  // Try get cached data if available before calling API
  _getDataFromEndpoint(String endpoint) async {
    final data = await DefaultCacheManager().getSingleFile(endpoint);
    return jsonDecode(await data.readAsString());
  }

  // Try get cached image if available before calling API
  Widget getImageFromEndpoint(String endpoint) => CachedNetworkImage(
        imageUrl: endpoint,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
}
