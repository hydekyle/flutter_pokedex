import 'package:flutter/material.dart';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_controller.dart';
import 'package:get/get.dart';
import '../../../models/dto/pokemon/pokemon.dart';
import '../../../models/dto/pokemon_data/pokemon_data.dart';

class PokemonInfoPage extends GetView<PokedexController> {
  final PokemonData pokemonData;

  const PokemonInfoPage({
    super.key,
    required this.pokemonData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: 180,
          child: ApiPokemonService.getPokemonImageByID(pokemonData.id),
        ),
        Text("${pokemonData.id}"),
        Text("Weight ${pokemonData.weight}"),
        Text("Height ${pokemonData.height}"),
        Row(
          children: pokemonData.types
              .map((element) => Text(element.type.name))
              .toList(),
        ),
        ElevatedButton(
          onPressed: () => controller.addToCapturedList(pokemonData.id),
          child: const Text("CAPTURE!"),
        ),
      ],
    );
  }
}
