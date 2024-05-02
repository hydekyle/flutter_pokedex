// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonForm _$PokemonFormFromJson(Map<String, dynamic> json) => PokemonForm(
      formName: json['form_name'] as String,
      formNames: json['form_names'] as List<dynamic>,
      formOrder: (json['form_order'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      isBattleOnly: json['is_battle_only'] as bool,
      isDefault: json['is_default'] as bool,
      isMega: json['is_mega'] as bool,
      name: json['name'] as String,
      names: json['names'] as List<dynamic>,
      order: (json['order'] as num).toInt(),
      pokemon: Pokemon.fromJson(json['pokemon'] as Map<String, dynamic>),
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroup:
          Pokemon.fromJson(json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonFormToJson(PokemonForm instance) =>
    <String, dynamic>{
      'form_name': instance.formName,
      'form_names': instance.formNames,
      'form_order': instance.formOrder,
      'id': instance.id,
      'is_battle_only': instance.isBattleOnly,
      'is_default': instance.isDefault,
      'is_mega': instance.isMega,
      'name': instance.name,
      'names': instance.names,
      'order': instance.order,
      'pokemon': instance.pokemon,
      'sprites': instance.sprites,
      'types': instance.types,
      'version_group': instance.versionGroup,
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      backDefault: json['back_default'] as String,
      backFemale: json['back_female'],
      backShiny: json['back_shiny'] as String,
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'] as String,
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'] as String,
      frontShinyFemale: json['front_shiny_female'],
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      slot: (json['slot'] as num).toInt(),
      type: Pokemon.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
