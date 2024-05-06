import 'package:flutter/material.dart';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:flutter_pokedex/ui/pages/captured_page/captured_controller.dart';
import 'package:flutter_pokedex/ui/widgets/button_pokemon.dart';
import 'package:get/get.dart';
import '../../../models/dto/pokemon_data/pokemon_data.dart';
import '../../theme/text_pokedex.dart';
import '../../widgets/chip_pokemon_type.dart';
import '../captured_page/captured_page.dart';

/// Show details of a Pokemon.
/// It shows when the users click a Pokemon from anywhere
class PokemonInfoPage extends GetView<CapturedController> {
  final PokemonData pokemonData;

  const PokemonInfoPage({
    super.key,
    required this.pokemonData,
  });

  @override
  Widget build(BuildContext context) {
    bool isCaptured = controller.isPokemonCaptured(pokemonData.id);
    return SizedBox(
      // Display as a row or as a column by screen direction
      child: Flex(
        direction: Get.width < Get.height ? Axis.vertical : Axis.horizontal,
        children: [
          // Name and ID
          Column(
            children: [
              TextPokedex.title(text: pokemonData.name.toUpperCase()),
              TextPokedex.id(text: pokemonData.id.parseToPokemonID()),
            ],
          ),
          // Pokemon photo
          SizedBox.square(
            dimension: 180,
            child: ApiPokemonService.getPokemonImageByID(pokemonData.id),
          ),
          // Weight and height
          Column(
            children: [
              Text("Weight: ${pokemonData.weight}"),
              Text("Height: ${pokemonData.height}"),
            ],
          ),
          // List of Pokemon types
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemonData.typeSlots
                  .map((element) => ChipPokemonType(
                        typeName: element.type.name,
                        showIcon: Icons.control_camera_sharp,
                        colorIcon: Colors.grey.shade300,
                      ))
                  .toList(),
            ),
          ),
          // Capture button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonPokemon(
              onPressed: isCaptured
                  ? () {
                      controller.deleteFromCapturedList(pokemonData.id);
                      Get.back();
                    }
                  : () {
                      Get.back();
                      controller.addToCapturedList(pokemonData.id);
                      Get.to(CapturedPage(animatedHeroID: pokemonData.id));
                    },
              text: isCaptured ? "RELEASE!" : "CAPTURE!",
            ),
          ),
        ],
      ),
    );
  }
}
