import 'package:flutter/material.dart';
import 'package:flutter_pokedex/controllers/pokedex_controller.dart';
import 'package:flutter_pokedex/models/pokemon_form/pokemon_form.dart';
import 'package:get/get.dart';
import 'package:flutter_elastic_list_view/flutter_elastic_list_view.dart';

class PokedexUI extends GetView<PokedexController> {
  const PokedexUI({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokedexController>(
      init: PokedexController()..init(),
      builder: (controller) => Obx(
        () => controller.pokemonList.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  SizedBox(
                    height: context.height * 0.5,
                    child: pokemonListPanel(
                      controller.pokemonList
                          .where((a) =>
                              a.name.contains(controller.pokemonFilter.value))
                          .toList(),
                    ),
                  ),
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

  Widget pokemonListPanel(List<PokemonForm> pokemonList) =>
      ElasticListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 200,
            child: Row(
              children: [
                Text(
                    "hola ${pokemonList[index].name} ${pokemonList[index].id}"),
                SizedBox.square(
                  dimension: 180,
                  child: controller.apiService.getImageFromEndpoint(
                      pokemonList[index].sprites.frontDefault),
                )
              ],
            ),
          );
        },
      );

  List<Widget> helloWorld(List<PokemonForm> pokemonList) {
    List<Widget> children = [];
    for (var x = 0; x < pokemonList.length; x++) {
      children.add(
        Row(
          children: [
            Text("hola ${pokemonList[x].name} ${pokemonList[x].id}"),
            SizedBox(
              height: 200,
              width: 200,
              child: controller.apiService
                  .getImageFromEndpoint(pokemonList[x].sprites.frontDefault),
            )
          ],
        ),
      );
    }
    return children;
  }

  // );
  //   controller.region.pokemonSpecies.forEach((pokemon) =>
  // Row(
  //       children: [
  //         Text("hola ${pokemon.name}"),
  //         SizedBox(
  //           height: 200,
  //           width: 200,
  //           child: controller.apiService
  //               .getImageFromEndpoint(pokemon.sprites.frontDefault),
  //         )
  //       ],
  //     ));
}
