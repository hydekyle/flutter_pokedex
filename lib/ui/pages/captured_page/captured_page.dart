import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/widgets/pokemon_list_panel.dart';
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

    List<Widget> widgets() {
      final List<Widget> widgets = [];
      for (var x = 0; x < controller.filterTypeList.length; x++) {
        widgets.add(GestureDetector(
          onTap: () =>
              controller.removeFilterType(controller.filterTypeList[x]),
          child: Row(children: [
            Text(controller.filterTypeList[x]),
            const Icon(Icons.delete),
          ]),
        ));
      }
      return widgets;
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.8,
            child: Obx(() => pokemonListPanel(
                  controller.filterTypeList.isNotEmpty
                      ? controller.filteredCapturedList
                      : controller.capturedList,
                  animatedHeroID,
                )),
          ),
          ElevatedButton(
            onPressed: () => controller.orderCapturedListByName(),
            child: const Text("Order By Name"),
          ),
          Obx(() => Row(
                children: [
                  ...widgets(),
                  controller.filterTypeList.length < 2
                      ? DropdownButton(
                          hint: const Text("Add filter"),
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
                      : Container(),
                ],
              )),
          ElevatedButton(
            onPressed: () {
              controller.changeThemeByCaputedList();
            },
            child: const Text("THEME"),
          ),
          ElevatedButton(
            onPressed: () {
              controller.clearFilterType();
              Get.back();
            },
            child: const Text("BACK"),
          ),
        ],
      ),
    );
  }
}
