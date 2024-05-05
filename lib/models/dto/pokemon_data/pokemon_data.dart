import 'package:json_annotation/json_annotation.dart';
part 'pokemon_data.g.dart';

@JsonSerializable()
class PokemonData {
  String name;
  int id;
  Sprites sprites;
  int weight;
  int height;
  Cries cries;
  @JsonKey(name: 'types')
  List<TypeSlot> typeSlots;

  PokemonData({
    required this.name,
    required this.id,
    required this.cries,
    required this.height,
    required this.sprites,
    required this.typeSlots,
    required this.weight,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) =>
      _$PokemonDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDataToJson(this);
}

@JsonSerializable()
class TypeSlot {
  int slot;
  PokemonType type;

  TypeSlot({
    required this.slot,
    required this.type,
  });

  factory TypeSlot.fromJson(Map<String, dynamic> json) =>
      _$TypeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$TypeSlotToJson(this);
}

@JsonSerializable()
class PokemonType {
  String name;
  String url;

  PokemonType({
    required this.name,
    required this.url,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

@JsonSerializable()
class Cries {
  String latest;
  String legacy;

  Cries({
    required this.latest,
    required this.legacy,
  });

  factory Cries.fromJson(Map<String, dynamic> json) => _$CriesFromJson(json);

  Map<String, dynamic> toJson() => _$CriesToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'back_default')
  String backDefault;
  @JsonKey(name: 'back_female')
  dynamic backFemale;
  @JsonKey(name: 'back_shiny')
  String backShiny;
  @JsonKey(name: 'back_shiny_female')
  dynamic backShinyFemale;
  @JsonKey(name: 'front_default')
  String frontDefault;
  @JsonKey(name: 'front_female')
  dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  String frontShiny;
  @JsonKey(name: 'front_shiny_female')
  dynamic frontShinyFemale;
  Sprites? animated;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
