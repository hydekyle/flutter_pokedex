import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/pages/captured_page/captured_controller.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_controller.dart';
import 'package:flutter_pokedex/ui/pages/pokedex_page/pokedex_page.dart';
import 'package:flutter_pokedex/ui/theme/theme.dart';
import 'package:get/get.dart';
import 'services/api_pokemon_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const Home());
}

init() async {
  // Load region data by ID (Kanto: 1)
  final generation = await ApiPokemonService.getGenerationDataByID(1);
  // Sort Pokemon List by ID since API delivers it unsorted
  generation.pokemonSpecies.sort((a, b) => a.id.compareTo(b.id));

  // Initialize controllers
  Get.put(PokedexController(generation));
  Get.put(CapturedController(generation)..init());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokédex Code Challenge',
      theme: ThemePokemon.getThemeDataByColor(Colors.deepOrange),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const PokedexPage(),
    );
  }
}
