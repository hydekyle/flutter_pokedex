import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pokedex/models/pokemon_form/pokemon_form.dart';
import 'package:get/get_connect/connect.dart';
import '../models/generation/generation.dart';

class ApiPokemonService extends GetConnect {
  Future<Generation> getRegionDataByGeneration(int generation) async {
    return Generation.fromJson(await getDataFromEndpoint(
        "https://pokeapi.co/api/v2/generation/$generation"));
  }

  // Future<Pokemon> getPokemonDataByID(int id) async {
  //   return Pokemon.fromJson(await getDataFromEndpoint(
  //       "https://pokeapi.co/api/v2/pokemon-species/$id"));
  // }

  Future<PokemonForm> getPokemonFormByID(int id) async {
    return PokemonForm.fromJson(await getDataFromEndpoint(
        "https://pokeapi.co/api/v2/pokemon-form/$id"));
  }

  getDataFromEndpoint(String endpoint) async {
    final data = await DefaultCacheManager().getSingleFile(endpoint);
    return jsonDecode(await data.readAsString());
  }

  getImageFromEndpoint(String endpoint) => CachedNetworkImage(
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
