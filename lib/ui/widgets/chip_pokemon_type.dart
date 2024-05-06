import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ui/theme/text_pokedex.dart';
import 'package:flutter_pokedex/ui/theme/theme.dart';

class ChipPokemonType extends StatelessWidget {
  final String typeName;
  final Function? onTap;
  final IconData? showIcon;
  final Color? colorIcon;

  const ChipPokemonType({
    super.key,
    required this.typeName,
    this.onTap,
    this.showIcon,
    this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    final color = ThemeDataPokemon.getColorByPokemonType(typeName);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap != null ? () => onTap!() : null,
        child: SizedBox(
          width: 150,
          child: Chip(
            avatar: CircleAvatar(
              foregroundColor: color,
              backgroundColor: color,
            ),
            label: showIcon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextPokedex.chip(
                          text: typeName,
                          color: color,
                          boxFit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(showIcon, color: colorIcon)
                    ],
                  )
                : TextPokedex.chip(text: typeName, color: color),
          ),
        ),
      ),
    );
  }
}
