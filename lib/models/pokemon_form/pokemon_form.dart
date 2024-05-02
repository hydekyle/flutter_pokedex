import 'package:json_annotation/json_annotation.dart';
part 'pokemon_form.g.dart';

@JsonSerializable()
class PokemonForm {
  @JsonKey(name: 'form_name')
  String formName;
  @JsonKey(name: 'form_names')
  List<dynamic> formNames;
  @JsonKey(name: 'form_order')
  int formOrder;
  int id;
  @JsonKey(name: 'is_battle_only')
  bool isBattleOnly;
  @JsonKey(name: 'is_default')
  bool isDefault;
  @JsonKey(name: 'is_mega')
  bool isMega;
  String name;
  List<dynamic> names;
  int order;
  Pokemon pokemon;
  Sprites sprites;
  List<Type> types;
  @JsonKey(name: 'version_group')
  Pokemon versionGroup;

  PokemonForm({
    required this.formName,
    required this.formNames,
    required this.formOrder,
    required this.id,
    required this.isBattleOnly,
    required this.isDefault,
    required this.isMega,
    required this.name,
    required this.names,
    required this.order,
    required this.pokemon,
    required this.sprites,
    required this.types,
    required this.versionGroup,
  });

  factory PokemonForm.fromJson(Map<String, dynamic> json) =>
      _$PokemonFormFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonFormToJson(this);
}

@JsonSerializable()
class Pokemon {
  String name;
  String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
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

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class Type {
  int slot;
  Pokemon type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
