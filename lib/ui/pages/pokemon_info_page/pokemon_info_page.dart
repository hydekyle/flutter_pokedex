import 'package:flutter/material.dart';
import 'package:flutter_pokedex/services/api_pokemon_service.dart';
import 'package:flutter_pokedex/ui/pages/captured_page/captured_controller.dart';
import 'package:get/get.dart';
import '../../../models/dto/pokemon_data/pokemon_data.dart';
import '../../theme/text_pokedex.dart';
import '../../widgets/chip_type.dart';
import '../captured_page/captured_page.dart';

class PokemonInfoPage extends GetView<CapturedController> {
  final PokemonData pokemonData;

  const PokemonInfoPage({
    super.key,
    required this.pokemonData,
  });

  @override
  Widget build(BuildContext context) {
    bool isCaptured = controller.isPokemonCaptured(pokemonData.id);
    return Column(
      children: [
        TextPokedex.title(text: pokemonData.name.toUpperCase()),
        TextPokedex.id(text: pokemonData.id.parseToPokemonID()),
        SizedBox.square(
          dimension: 180,
          child: ApiPokemonService.getPokemonImageByID(pokemonData.id),
        ),
        Text("Weight ${pokemonData.weight}"),
        Text("Height ${pokemonData.height}"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pokemonData.typeSlots
                .map((element) => ChipType(typeName: element.type.name))
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ElevatedButton(
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
            child: isCaptured ? const Text("RELEASE!") : const Text("CAPTURE!"),
          ),
        ),
      ],
    );
  }
}
