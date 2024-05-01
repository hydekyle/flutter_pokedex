import 'package:get/get_connect/connect.dart';

class ApiPokemonService extends GetConnect {
  Future<Response> getPokemonData(int id) =>
      get("https://pokeapi.co/api/v2/pokemon-species/$id");
}
