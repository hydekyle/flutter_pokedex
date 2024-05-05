import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/pages/captured_page/captured_page.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_controller.dart';
import 'package:get/get.dart';
import '../../widgets/pokemon_list_panel.dart';

class PokedexPage extends GetView<PokedexController> {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pokemon Elastic List
        SizedBox(
          height: context.height * 0.8,
          child: pokemonListPanel(
              controller.generation.pokemonSpecies
                  .where((a) =>
                      a.name.contains(controller.pokemonNameFilter.value))
                  .toList(),
              null),
        ),
        // Name Filter
        Center(
          child: SizedBox(
            width: 200,
            child: TextFormField(
              onChanged: (value) => controller.pokemonNameFilter.value = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Filter by name',
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Get.to(const CapturedPage()),
          child: const Text("Tocame"),
        ),
      ],
    );
  }
}
