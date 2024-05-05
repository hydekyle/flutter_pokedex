import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/pages/captured_page/captured_controller.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_controller.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pokedexController = Get.put(PokedexController());
  await pokedexController.init();
  final capturedController = Get.put(CapturedController());
  await capturedController.init();
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokédex Code Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pokédex Code Challenge'),
      ),
      body: const PokedexPage(),
    );
  }
}
