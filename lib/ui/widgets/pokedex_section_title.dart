import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/text_pokedex.dart';

class PokedexSectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? height;
  final double? width;

  const PokedexSectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 150,
      width: width,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            color: context.theme.primaryColor,
            child: SizedBox(
              width: double.infinity,
              child: SizedBox.square(
                dimension: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextPokedex.title(
                        text: title,
                        scaleFactor: 2,
                        color: context.theme.secondaryHeaderColor,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                    Flexible(
                      child: TextPokedex(
                        text: subtitle,
                        color: context.theme.secondaryHeaderColor,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
