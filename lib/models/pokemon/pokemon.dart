import 'package:json_annotation/json_annotation.dart';
part 'pokemon.g.dart';

// To generate the needed JsonSerializableGenerator data,
// use the following command while editing this file:
// dart run build_runner watch __delete_conflicting_outputs

@JsonSerializable()
class Pokemon {
  @JsonKey(name: 'base_happiness')
  int baseHappiness;
  @JsonKey(name: 'capture_rate')
  int captureRate;
  Color color;
  @JsonKey(name: 'egg_groups')
  List<Color> eggGroups;
  @JsonKey(name: 'evolution_chain')
  EvolutionChain evolutionChain;
  @JsonKey(name: 'evolves_from_species')
  dynamic evolvesFromSpecies;
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntry> flavorTextEntries;
  @JsonKey(name: 'form_descriptions')
  List<dynamic> formDescriptions;
  @JsonKey(name: 'forms_switchable')
  bool formsSwitchable;
  @JsonKey(name: 'gender_rate')
  int genderRate;
  List<Genus> genera;
  Color generation;
  @JsonKey(name: 'growth_rate')
  Color growthRate;
  Color habitat;
  @JsonKey(name: 'has_gender_differences')
  bool hasGenderDifferences;
  @JsonKey(name: 'hatch_counter')
  int hatchCounter;
  int id;
  @JsonKey(name: 'is_baby')
  bool isBaby;
  @JsonKey(name: 'is_legendary')
  bool isLegendary;
  @JsonKey(name: 'is_mythical')
  bool isMythical;
  String name;
  List<Name> names;
  int order;
  @JsonKey(name: 'pal_park_encounters')
  List<PalParkEncounter> palParkEncounters;
  @JsonKey(name: 'pokedex_numbers')
  List<PokedexNumber> pokedexNumbers;
  Color shape;
  List<Variety> varieties;

  Pokemon({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Color {
  String name;
  String url;

  Color({
    required this.name,
    required this.url,
  });

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);

  Map<String, dynamic> toJson() => _$ColorToJson(this);
}

@JsonSerializable()
class EvolutionChain {
  String url;

  EvolutionChain({
    required this.url,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);
}

@JsonSerializable()
class FlavorTextEntry {
  @JsonKey(name: 'flavor_text')
  String flavorText;
  Color language;
  Color version;

  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextEntryToJson(this);
}

@JsonSerializable()
class Genus {
  String genus;
  Color language;

  Genus({
    required this.genus,
    required this.language,
  });

  factory Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);

  Map<String, dynamic> toJson() => _$GenusToJson(this);
}

@JsonSerializable()
class Name {
  Color language;
  String name;

  Name({
    required this.language,
    required this.name,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class PalParkEncounter {
  Color area;
  @JsonKey(name: 'base_score')
  int baseScore;
  int rate;

  PalParkEncounter({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      _$PalParkEncounterFromJson(json);

  Map<String, dynamic> toJson() => _$PalParkEncounterToJson(this);
}

@JsonSerializable()
class PokedexNumber {
  @JsonKey(name: 'entry_number')
  int entryNumber;
  Color pokedex;

  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  factory PokedexNumber.fromJson(Map<String, dynamic> json) =>
      _$PokedexNumberFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexNumberToJson(this);
}

@JsonSerializable()
class Variety {
  @JsonKey(name: 'is_default')
  bool isDefault;
  Color pokemon;

  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  factory Variety.fromJson(Map<String, dynamic> json) =>
      _$VarietyFromJson(json);

  Map<String, dynamic> toJson() => _$VarietyToJson(this);
}
