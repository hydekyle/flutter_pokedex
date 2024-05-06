import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/pages/captured_page/captured_controller.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_controller.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initControllers();
  runApp(const Pokedex());
}

initControllers() async {
  final pokedexController = Get.put(PokedexController(generationID: 1));
  await pokedexController.init();
  final capturedController =
      Get.put(CapturedController(generation: pokedexController.generation));
  await capturedController.init();
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokédex Code Challenge',
      theme: ThemeData.light(),
      themeMode: ThemeMode.light,
      home: const PokedexPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
