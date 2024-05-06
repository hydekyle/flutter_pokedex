import 'package:flutter/material.dart';

/// A reusable widget to display standardized buttons
class ButtonPokemon extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final double? height;

  const ButtonPokemon({
    super.key,
    required this.text,
    this.onPressed,
    this.height,
  });

  const ButtonPokemon.big({
    super.key,
    required this.text,
    this.onPressed,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
