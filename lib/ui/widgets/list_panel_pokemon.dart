import 'package:flutter/material.dart';
import 'package:flutter_elastic_list_view/flutter_elastic_list_view.dart';
import 'package:flutter_pokedex/ui/theme/text_pokedex.dart';
import 'package:get/get.dart';
import '../../models/dto/pokemon/pokemon.dart';
import '../../services/api_pokemon_service.dart';
import '../pages/pokemon_info_page/pokemon_info_page.dart';

/// Display a scrollable list of Pokemon
Widget listPanelPokemon(
  List<Pokemon> pokemonList, {
  int? heroTagID,
  double? height,
}) =>
    ElasticListView.builder(
      itemCount: pokemonList.length,
      itemBuilder: (BuildContext context, int index) {
        final pokemon = pokemonList[index];
        return SizedBox(
          height: height ?? 150,
          child: GestureDetector(
            onTap: () => pokemon
                .getPokemonData()
                .then((pokemonData) => Get.defaultDialog(
                      title: "",
                      content: PokemonInfoPage(pokemonData: pokemonData),
                    )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextPokedex(text: pokemon.name.toUpperCase()),
                    TextPokedex.id(text: pokemon.id.parseToPokemonID()),
                  ],
                ),
                heroTagID == null || pokemon.id == heroTagID
                    ? Hero(
                        tag: pokemon.id,
                        child: SizedBox.square(
                          dimension: 140,
                          child:
                              ApiPokemonService.getPokemonImageByID(pokemon.id),
                        ),
                      )
                    : SizedBox.square(
                        dimension: 140,
                        child:
                            ApiPokemonService.getPokemonImageByID(pokemon.id),
                      ),
              ],
            ),
          ),
        );
      },
    );
