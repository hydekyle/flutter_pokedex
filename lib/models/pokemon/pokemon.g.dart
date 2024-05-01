// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      baseHappiness: (json['base_happiness'] as num).toInt(),
      captureRate: (json['capture_rate'] as num).toInt(),
      color: Color.fromJson(json['color'] as Map<String, dynamic>),
      eggGroups: (json['egg_groups'] as List<dynamic>)
          .map((e) => Color.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolutionChain: EvolutionChain.fromJson(
          json['evolution_chain'] as Map<String, dynamic>),
      evolvesFromSpecies: json['evolves_from_species'],
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      formDescriptions: json['form_descriptions'] as List<dynamic>,
      formsSwitchable: json['forms_switchable'] as bool,
      genderRate: (json['gender_rate'] as num).toInt(),
      genera: (json['genera'] as List<dynamic>)
          .map((e) => Genus.fromJson(e as Map<String, dynamic>))
          .toList(),
      generation: Color.fromJson(json['generation'] as Map<String, dynamic>),
      growthRate: Color.fromJson(json['growth_rate'] as Map<String, dynamic>),
      habitat: Color.fromJson(json['habitat'] as Map<String, dynamic>),
      hasGenderDifferences: json['has_gender_differences'] as bool,
      hatchCounter: (json['hatch_counter'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      isBaby: json['is_baby'] as bool,
      isLegendary: json['is_legendary'] as bool,
      isMythical: json['is_mythical'] as bool,
      name: json['name'] as String,
      names: (json['names'] as List<dynamic>)
          .map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: (json['order'] as num).toInt(),
      palParkEncounters: (json['pal_park_encounters'] as List<dynamic>)
          .map((e) => PalParkEncounter.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokedexNumbers: (json['pokedex_numbers'] as List<dynamic>)
          .map((e) => PokedexNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      shape: Color.fromJson(json['shape'] as Map<String, dynamic>),
      varieties: (json['varieties'] as List<dynamic>)
          .map((e) => Variety.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'base_happiness': instance.baseHappiness,
      'capture_rate': instance.captureRate,
      'color': instance.color,
      'egg_groups': instance.eggGroups,
      'evolution_chain': instance.evolutionChain,
      'evolves_from_species': instance.evolvesFromSpecies,
      'flavor_text_entries': instance.flavorTextEntries,
      'form_descriptions': instance.formDescriptions,
      'forms_switchable': instance.formsSwitchable,
      'gender_rate': instance.genderRate,
      'genera': instance.genera,
      'generation': instance.generation,
      'growth_rate': instance.growthRate,
      'habitat': instance.habitat,
      'has_gender_differences': instance.hasGenderDifferences,
      'hatch_counter': instance.hatchCounter,
      'id': instance.id,
      'is_baby': instance.isBaby,
      'is_legendary': instance.isLegendary,
      'is_mythical': instance.isMythical,
      'name': instance.name,
      'names': instance.names,
      'order': instance.order,
      'pal_park_encounters': instance.palParkEncounters,
      'pokedex_numbers': instance.pokedexNumbers,
      'shape': instance.shape,
      'varieties': instance.varieties,
    };

Color _$ColorFromJson(Map<String, dynamic> json) => Color(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      url: json['url'] as String,
    );

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) =>
    FlavorTextEntry(
      flavorText: json['flavor_text'] as String,
      language: Color.fromJson(json['language'] as Map<String, dynamic>),
      version: Color.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextEntryToJson(FlavorTextEntry instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

Genus _$GenusFromJson(Map<String, dynamic> json) => Genus(
      genus: json['genus'] as String,
      language: Color.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenusToJson(Genus instance) => <String, dynamic>{
      'genus': instance.genus,
      'language': instance.language,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      language: Color.fromJson(json['language'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'language': instance.language,
      'name': instance.name,
    };

PalParkEncounter _$PalParkEncounterFromJson(Map<String, dynamic> json) =>
    PalParkEncounter(
      area: Color.fromJson(json['area'] as Map<String, dynamic>),
      baseScore: (json['base_score'] as num).toInt(),
      rate: (json['rate'] as num).toInt(),
    );

Map<String, dynamic> _$PalParkEncounterToJson(PalParkEncounter instance) =>
    <String, dynamic>{
      'area': instance.area,
      'base_score': instance.baseScore,
      'rate': instance.rate,
    };

PokedexNumber _$PokedexNumberFromJson(Map<String, dynamic> json) =>
    PokedexNumber(
      entryNumber: (json['entry_number'] as num).toInt(),
      pokedex: Color.fromJson(json['pokedex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokedexNumberToJson(PokedexNumber instance) =>
    <String, dynamic>{
      'entry_number': instance.entryNumber,
      'pokedex': instance.pokedex,
    };

Variety _$VarietyFromJson(Map<String, dynamic> json) => Variety(
      isDefault: json['is_default'] as bool,
      pokemon: Color.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VarietyToJson(Variety instance) => <String, dynamic>{
      'is_default': instance.isDefault,
      'pokemon': instance.pokemon,
    };
