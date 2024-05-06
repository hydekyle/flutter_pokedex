import 'package:flutter/material.dart';

class ThemeDataPokemon {
  static Color getColorByPokemonType(String typeName) {
    switch (typeName) {
      case "normal":
        return Colors.grey;
      case "fighting":
        return Colors.brown.shade700;
      case "flying":
        return Colors.blueGrey;
      case "poison":
        return Colors.deepPurple;
      case "ground":
        return Colors.orange;
      case "rock":
        return Colors.brown;
      case "bug":
        return Colors.pink;
      case "ghost":
        return Colors.deepPurple.shade800;
      case "fire":
        return Colors.red;
      case "water":
        return Colors.blue;
      case "grass":
        return Colors.green;
      case "electric":
        return Colors.amber;
      case "psychic":
        return Colors.pink;
      case "ice":
        return Colors.cyan;
      case "dragon":
        return Colors.purple;
      case "fairy":
        return Colors.pink.shade300;
      case _:
        return Colors.deepOrange;
    }
  }

  static ThemeData getThemeData({Color? themeColor}) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeColor ?? Colors.deepOrange,
      ),
    );
  }
}
