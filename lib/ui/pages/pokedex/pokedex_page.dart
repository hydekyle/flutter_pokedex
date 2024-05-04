import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/pages/pokedex/pokedex_controller.dart';
import 'package:get/get.dart';
import '../../widgets/pokemon_list_panel.dart';

class PokedexPage extends GetView<PokedexController> {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokedexController>(
      init: PokedexController()..init(),
      builder: (controller) => Obx(
        () => controller.generation !=
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  // Pokemon Elastic List
                  SizedBox(
                    height: context.height * 0.5,
                    child: pokemonListPanel(
                      controller.generation.pokemonSpecies
                          .where((a) => a.name
                              .contains(controller.pokemonNameFilter.value))
                          .toList(),
                    ),
                  ),
                  // Name Filter
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        onChanged: (value) =>
                            controller.pokemonNameFilter.value = value,
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
}
