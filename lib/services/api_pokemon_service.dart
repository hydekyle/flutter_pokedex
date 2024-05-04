import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pokedex/models/dto/pokemon_data/pokemon_data.dart';
import '../models/dto/pokemon_generation/pokemon_generation.dart';

class ApiPokemonService {
  // API endpoints
  static Future<PokemonGeneration> getGenerationDataByID(int id) async {
    return PokemonGeneration.fromJson(
        await getDataFromEndpoint("https://pokeapi.co/api/v2/generation/$id"));
  }

  static Future<PokemonData> getPokemonDataByID(int id) async {
    return PokemonData.fromJson(
        await getDataFromEndpoint("https://pokeapi.co/api/v2/pokemon/$id"));
  }

  static Widget getPokemonImageByID(int pokemonID) => getImageFromEndpoint(
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonID.png");

  // Try get cached data if available before calling API
  static getDataFromEndpoint(String endpoint) async {
    final data = await DefaultCacheManager().getSingleFile(endpoint);
    return jsonDecode(await data.readAsString());
  }

  // Try get cached image if available before calling API
  static Widget getImageFromEndpoint(String endpoint) => CachedNetworkImage(
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
