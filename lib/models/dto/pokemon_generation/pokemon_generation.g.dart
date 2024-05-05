// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_generation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonGeneration _$PokemonGenerationFromJson(Map<String, dynamic> json) =>
    PokemonGeneration(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      pokemonSpecies: (json['pokemon_species'] as List<dynamic>)
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonGenerationToJson(PokemonGeneration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pokemon_species': instance.pokemonSpecies,
      'types': instance.types,
    };
