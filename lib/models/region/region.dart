import 'package:json_annotation/json_annotation.dart';
part 'region.g.dart';

@JsonSerializable()
class Region {
  List<dynamic> abilities;
  int id;
  @JsonKey(name: 'main_region')
  MainRegion mainRegion;
  List<MainRegion> moves;
  String name;
  List<Name> names;
  @JsonKey(name: 'pokemon_species')
  List<MainRegion> pokemonSpecies;
  List<MainRegion> types;
  @JsonKey(name: 'version_groups')
  List<MainRegion> versionGroups;

  Region({
    required this.abilities,
    required this.id,
    required this.mainRegion,
    required this.moves,
    required this.name,
    required this.names,
    required this.pokemonSpecies,
    required this.types,
    required this.versionGroups,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class MainRegion {
  String name;
  String url;

  MainRegion({
    required this.name,
    required this.url,
  });
  factory MainRegion.fromJson(Map<String, dynamic> json) =>
      _$MainRegionFromJson(json);

  Map<String, dynamic> toJson() => _$MainRegionToJson(this);
}

@JsonSerializable()
class Name {
  MainRegion language;
  String name;

  Name({
    required this.language,
    required this.name,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
