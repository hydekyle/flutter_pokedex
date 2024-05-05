import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/dto/pokemon/pokemon.dart';
import 'package:flutter_pokedex/ui/widgets/pokemon_list_panel.dart';
import 'package:get/get.dart';

class CapturedPage extends StatelessWidget {
  final List<Pokemon> capturedPokemon;

  const CapturedPage({
    super.key,
    required this.capturedPokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.5,
            child: pokemonListPanel(capturedPokemon),
          ),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text("BACK"),
          ),
        ],
      ),
    );
  }
}
