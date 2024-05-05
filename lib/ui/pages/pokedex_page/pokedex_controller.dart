import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:get/get.dart';
import '../../../models/dto/pokemon_generation/pokemon_generation.dart';

class PokedexController extends GetxController {
  late final PokemonGeneration generation;
  final pokemonNameFilter = "".obs;

  init() async {
    // Load region data
    generation = await ApiPokemonService.getGenerationDataByID(1);
    // Sort Pokemon List by ID since API delivers it unsorted
    generation.pokemonSpecies.sort((a, b) => a.id.compareTo(b.id));
  }
}
