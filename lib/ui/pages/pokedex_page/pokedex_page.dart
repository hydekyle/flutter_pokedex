import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/pages/captured_page/captured_page.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_controller.dart';
import 'package:flutter_pokedex/ui/widgets/pokedex_section_title.dart';
import 'package:get/get.dart';
import '../../theme/text_pokedex.dart';
import '../../widgets/button_pokemon.dart';
import '../../widgets/list_panel_pokemon.dart';

class PokedexPage extends GetView<PokedexController> {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = Get.width > Get.height;
    return Scaffold(
      appBar: AppBar(
        title: const TextPokedex.titlePage(text: "Pokedex"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Flex(
          direction: isLandscape ? Axis.horizontal : Axis.vertical,
          children: [
            // Pokemon Elastic List
            Flexible(
              flex: 10,
              child: Column(
                children: [
                  Flexible(
                    flex: 6,
                    child: Obx(() => listPanelPokemon(
                          controller.generation.pokemonSpecies
                              .where((a) => a.name
                                  .contains(controller.pokemonNameFilter.value))
                              .toList(),
                        )),
                  ),
                  // Name Filter
                  Flexible(
                    child: Center(
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
                  ),
                ],
              ),
            ),

            const Spacer(),
            ButtonPokemon.big(
              onPressed: () => Get.to(const CapturedPage()),
              text: "Go to my captured pokemons",
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
