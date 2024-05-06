import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// A method extension to parse int (pokemonID) as string with 000 format
extension ParseToPokemonID on int {
  String parseToPokemonID() {
    String value = toString();
    if (value.length == 1) {
      value = "00$value";
    } else if (value.length == 2) {
      value = "0$value";
    }
    return "#$value";
  }
}

/// A reusable widget to display standardized text using Google Fonts
class TextPokedex extends StatelessWidget {
  final bool? textOverflow;
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool withShadow;
  final BoxFit? boxFit;
  final double? scaleFactor;
  final Shadow shadow = const Shadow(
      blurRadius: 1.5, color: Colors.black87, offset: Offset(2.0, 2.0));

  const TextPokedex({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 18,
    this.fontWeight,
    this.height = 1.2,
    this.textAlign = TextAlign.left,
    this.textOverflow = false,
    this.maxLines,
    this.withShadow = false,
    this.boxFit,
    this.scaleFactor,
  });

  const TextPokedex.title({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 28,
    this.fontWeight,
    this.height = 1.2,
    this.textAlign = TextAlign.left,
    this.textOverflow = false,
    this.maxLines,
    this.withShadow = false,
    this.boxFit,
    this.scaleFactor,
  });

  const TextPokedex.titlePage({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 32,
    this.fontWeight,
    this.height = 1.2,
    this.textAlign = TextAlign.center,
    this.textOverflow = false,
    this.maxLines,
    this.withShadow = false,
    this.boxFit,
    this.scaleFactor,
  });

  const TextPokedex.id({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight,
    this.height = 1.2,
    this.textAlign = TextAlign.left,
    this.textOverflow = false,
    this.maxLines,
    this.withShadow = false,
    this.boxFit,
    this.scaleFactor,
  });

  const TextPokedex.chip({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w800,
    this.height = 1,
    this.textAlign = TextAlign.left,
    this.textOverflow = false,
    this.maxLines,
    this.withShadow = false,
    this.boxFit,
    this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    if (boxFit != null && boxFit != BoxFit.none) {
      return FittedBox(
        fit: boxFit!,
        child: Text(
          text,
          style: _buildTextStyle(),
          textAlign: textAlign,
          overflow: (textOverflow ?? false)
              ? TextOverflow.ellipsis
              : TextOverflow.visible,
          maxLines: maxLines,
          textScaleFactor: scaleFactor ?? Get.textScaleFactor,
        ),
      );
    }

    return Text(
      text,
      style: _buildTextStyle(),
      textAlign: textAlign,
      overflow: (textOverflow ?? false)
          ? TextOverflow.ellipsis
          : TextOverflow.visible,
      maxLines: maxLines,
      textScaleFactor: scaleFactor ?? Get.textScaleFactor,
    );
  }

  TextStyle _buildTextStyle() => GoogleFonts.getFont(
        'Lekton',
        fontSize: fontSize * Get.textScaleFactor,
        color: color,
        fontWeight: fontWeight,
        height: height ?? 1.4,
        shadows: withShadow ? [shadow] : [],
      );
}
