import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/theme/text_pokedex.dart';
import 'package:flutter_pokedex/ui/theme/theme.dart';

class ChipType extends StatelessWidget {
  final String typeName;
  final Function? onTap;
  final IconData? showIcon;

  const ChipType({
    super.key,
    required this.typeName,
    this.onTap,
    this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    final color = ThemeDataPokemon.getColorByPokemonType(typeName);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap != null ? () => onTap!() : null,
        child: Chip(
          avatar: CircleAvatar(
            foregroundColor: color,
            backgroundColor: color,
          ),
          label: showIcon != null
              ? Row(
                  children: [
                    const SizedBox(width: 10),
                    TextPokedex.chip(text: typeName, color: color),
                    const SizedBox(width: 10),
                    Icon(showIcon)
                  ],
                )
              : TextPokedex.chip(text: typeName, color: color),
        ),
      ),
    );
  }
}
