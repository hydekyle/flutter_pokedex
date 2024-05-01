// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      abilities: json['abilities'] as List<dynamic>,
      id: (json['id'] as num).toInt(),
      mainRegion:
          MainRegion.fromJson(json['main_region'] as Map<String, dynamic>),
      moves: (json['moves'] as List<dynamic>)
          .map((e) => MainRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      names: (json['names'] as List<dynamic>)
          .map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonSpecies: (json['pokemon_species'] as List<dynamic>)
          .map((e) => MainRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => MainRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroups: (json['version_groups'] as List<dynamic>)
          .map((e) => MainRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'abilities': instance.abilities,
      'id': instance.id,
      'main_region': instance.mainRegion,
      'moves': instance.moves,
      'name': instance.name,
      'names': instance.names,
      'pokemon_species': instance.pokemonSpecies,
      'types': instance.types,
      'version_groups': instance.versionGroups,
    };

MainRegion _$MainRegionFromJson(Map<String, dynamic> json) => MainRegion(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$MainRegionToJson(MainRegion instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      language: MainRegion.fromJson(json['language'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'language': instance.language,
      'name': instance.name,
    };
