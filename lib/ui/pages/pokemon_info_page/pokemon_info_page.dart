import 'package:flutter/material.dart';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import '../../../models/dto/pokemon/pokemon.dart';
import '../../../models/dto/pokemon_data/pokemon_data.dart';

class PokemonInfoPage extends StatelessWidget {
  final PokemonData pokemonData;

  const PokemonInfoPage({
    super.key,
    required this.pokemonData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: pokemonData.id,
          child: SizedBox.square(
            dimension: 180,
            child: ApiPokemonService.getPokemonImageByID(pokemonData.id),
          ),
        ),
        Text("${pokemonData.id}"),
        Text("Weight ${pokemonData.weight}"),
        Text("Height ${pokemonData.height}"),
        Row(
          children: pokemonData.types
              .map((element) => Text(element.type.name))
              .toList(),
        ),
      ],
    );
  }
}
