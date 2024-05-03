import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pokemon_data/pokemon_data.dart';
part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  String name;
  String url;
  int? _id;
  PokemonData? _pokemonData;

  Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  // We can get the ID from the url
  int getMyID() {
    if (_id == null) {
      final res = url.split("/");
      _id = int.parse(res[res.length - 2]);
    }
    return _id!;
  }
}
