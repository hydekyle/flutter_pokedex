import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_controller.dart';
import 'package:flutter_pokedex/ui/widgets/pokemon_list_panel.dart';
import 'package:get/get.dart';

import '../../../models/dto/pokemon_data/pokemon_data.dart';

class CapturedPage extends GetView<PokedexController> {
  CapturedPage({super.key});
  final filterTypeList = RxList<PokemonType>();

  @override
  Widget build(BuildContext context) {
    controller.orderByID();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.8,
            child: Obx(() => pokemonListPanel(controller.capturedList)),
          ),
          ElevatedButton(
            onPressed: () => controller.orderByName(),
            child: const Text("Order By Name"),
          ),
          ElevatedButton(
            onPressed: () => controller.filterByTypes(filterTypeList),
            child: const Text("Order By Type"),
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
