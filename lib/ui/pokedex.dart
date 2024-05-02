import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/controllers/pokedex_controller.dart';
import 'package:flutter_pokedex/models/pokemon_form/pokemon_form.dart';
import 'package:get/get.dart';

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
                children: helloWorld(controller.pokemonList),
              ),
      ),
    );
  }

  List<Widget> helloWorld(List<PokemonForm> pokemonList) {
    List<Widget> children = [];
    for (var x = 0; x < pokemonList.length; x++) {
      children.add(
        Row(
          children: [
            Text("hola ${pokemonList[x].name}"),
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
