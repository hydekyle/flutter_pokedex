import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/ui/theme/text_pokedex.dart';
import 'package:flutter_pokedex/ui/widgets/button_pokemon.dart';
import 'package:flutter_pokedex/ui/widgets/chip_pokemon_type.dart';
import 'package:flutter_pokedex/ui/widgets/list_panel_pokemon.dart';
import 'package:flutter_pokedex/ui/widgets/pokedex_section_title.dart';
import 'package:get/get.dart';
import 'captured_controller.dart';

class CapturedPage extends GetView<CapturedController> {
  final int? animatedHeroID;

  const CapturedPage({
    super.key,
    this.animatedHeroID,
  });

  @override
  Widget build(BuildContext context) {
    controller.orderCapturedListByID();

    List<Widget> filterChipTypes() {
      final List<Widget> widgets = [];
      for (var x = 0; x < controller.filterTypeList.length; x++) {
        widgets.add(ChipPokemonType(
          typeName: controller.filterTypeList[x],
          showIcon: Icons.delete,
          onTap: () =>
              controller.removeFilterType(controller.filterTypeList[x]),
        ));
      }
      return widgets;
    }

    final isLandscape = Get.width > Get.height;

    return Scaffold(
      appBar: AppBar(
        title: const TextPokedex.titlePage(text: "Captured List"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: SizedBox(
        height: context.height,
        child: Column(
          children: [
            Obx(() => Flexible(
                  flex: 10,
                  child: listPanelPokemon(
                    controller.filterTypeList.isNotEmpty
                        ? controller.filteredCapturedList
                        : controller.capturedList,
                    heroTagID: animatedHeroID,
                  ),
                )),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ButtonPokemon(
                              onPressed: () =>
                                  controller.orderCapturedListByName(),
                              text: "Order by name",
                            ),
                          ),
                          Flex(
                            direction: Get.width < Get.height
                                ? Axis.vertical
                                : Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: TextPokedex(text: "Filter by type:"),
                              ),
                              ...filterChipTypes(),
                              controller.filterTypeList.length < 2
                                  ? DropdownButton(
                                      hint:
                                          const TextPokedex(text: "Add filter"),
                                      items: controller.availableTypeNames
                                          .map<DropdownMenuItem<String>>(
                                              (typeName) => DropdownMenuItem(
                                                    value: typeName,
                                                    child: Text(typeName),
                                                  ))
                                          .toList(),
                                      onChanged: (value) {
                                        controller.addFilterType(value!);
                                      },
                                    )
                                  : const SizedBox.square(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
