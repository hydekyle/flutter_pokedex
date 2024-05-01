import 'package:flutter/material.dart';
import 'package:flutter_pokedex/controllers/pokedex_controller.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokédex Code Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
      body: GetBuilder<PokedexController>(
        init: PokedexController()..init(),
        builder: (controller) => Obx(
          () => controller.pokemonList.isEmpty
              ? const CircularProgressIndicator()
              : Text(controller.pokemonList[0].name),
        ),
      ),
    );
  }
}
