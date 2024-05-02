import 'package:json_annotation/json_annotation.dart';
part 'Generation.g.dart';

@JsonSerializable()
class Generation {
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

  Generation({
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

  factory Generation.fromJson(Map<String, dynamic> json) =>
      _$GenerationFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationToJson(this);
}

@JsonSerializable()
class MainRegion {
  String name;
  String url;
  int? id;

  MainRegion({
    required this.name,
    required this.url,
  });
  factory MainRegion.fromJson(Map<String, dynamic> json) =>
      _$MainRegionFromJson(json);

  Map<String, dynamic> toJson() => _$MainRegionToJson(this);

  int getMyID() {
    if (id == null) {
      final res = url.split("/");
      id = int.parse(res[res.length - 2]);
    }
    return id!;
  }
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
