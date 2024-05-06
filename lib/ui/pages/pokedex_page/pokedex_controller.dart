import 'package:get/get.dart';
import '../../../models/dto/pokemon_generation/pokemon_generation.dart';

/// Handles the regional Pokedex, it's only used from pokedex_page.dart,
/// but it could be used from anywhere since we use Get.put() in main.dart
class PokedexController extends GetxController {
  final PokemonGeneration generation;
  final pokemonNameFilter = "".obs;

  PokedexController(this.generation);
}
