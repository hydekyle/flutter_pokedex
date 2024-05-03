import 'package:json_annotation/json_annotation.dart';

import '../pokemon/pokemon.dart';
part 'pokemon_generation.g.dart';

@JsonSerializable()
class PokemonGeneration {
  int id;
  String name;
  @JsonKey(name: 'pokemon_species')
  List<Pokemon> pokemonSpecies;

  PokemonGeneration({
    required this.id,
    required this.name,
    required this.pokemonSpecies,
  });

  factory PokemonGeneration.fromJson(Map<String, dynamic> json) =>
      _$PokemonGenerationFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonGenerationToJson(this);
}
