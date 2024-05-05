import 'package:flutter/material.dart';
import 'package:flutter_elastic_list_view/flutter_elastic_list_view.dart';
import 'package:get/get.dart';
import '../../models/dto/pokemon/pokemon.dart';
import '../../services/api_pokemon_service.dart';
import '../pages/pokemon_info_page/pokemon_info_page.dart';

Widget pokemonListPanel(List<Pokemon> pokemonList, int? heroTagID) =>
    ElasticListView.builder(
      itemCount: pokemonList.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 200,
          child: GestureDetector(
            onTap: () => pokemonList[index]
                .getPokemonData()
                .then((pokemonData) => Get.defaultDialog(
                      title: pokemonData.name,
                      content: PokemonInfoPage(pokemonData: pokemonData),
                    )),
            child: Row(
              children: [
                Text(
                  "hola ${pokemonList[index].name} ${pokemonList[index].id}",
                ),
                heroTagID == null || pokemonList[index].id == heroTagID
                    ? Hero(
                        tag: pokemonList[index].id,
                        child: SizedBox.square(
                          dimension: 180,
                          child: ApiPokemonService.getPokemonImageByID(
                              pokemonList[index].id),
                        ),
                      )
                    : SizedBox.square(
                        dimension: 180,
                        child: ApiPokemonService.getPokemonImageByID(
                            pokemonList[index].id),
                      ),
              ],
            ),
          ),
        );
      },
    );
