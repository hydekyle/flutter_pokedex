import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/pages/pokedex/pokedex_controller.dart';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:get/get.dart';
import 'package:flutter_elastic_list_view/flutter_elastic_list_view.dart';

import '../../../models/dto/pokemon/pokemon.dart';

class PokedexPage extends GetView<PokedexController> {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokedexController>(
      init: PokedexController()..init(),
      builder: (controller) => Obx(
        () => controller.pokemonList.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  // Pokemon Elastic List
                  SizedBox(
                    height: context.height * 0.5,
                    child: pokemonListPanel(
                      controller.generation.pokemonSpecies
                          .where((a) =>
                              a.name.contains(controller.pokemonFilter.value))
                          .toList(),
                    ),
                  ),
                  // Name Filter
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        onChanged: (value) =>
                            controller.pokemonFilter.value = value,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Filter by name',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget pokemonListPanel(List<Pokemon> pokemonList) => ElasticListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 200,
            child: Row(
              children: [
                Text(
                  "hola ${pokemonList[index].name} ${pokemonList[index].getMyID()}",
                ),
                SizedBox.square(
                  dimension: 180,
                  child: ApiPokemonService()
                      .getPokemonImageByID(pokemonList[index].getMyID()),
                ),
              ],
            ),
          );
        },
      );
}
