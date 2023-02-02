import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BaseColors {
  static const secondary = Color.fromRGBO(93, 51, 227, 0.4);
  static const purple = Color.fromRGBO(62, 40, 136, 1);
  static const purpleDark = Color.fromRGBO(39, 30, 71, 1);
  static const textLigth = Color.fromARGB(255, 255, 255, 255);
  static const textDark = Color.fromRGBO(142, 142, 147, 1);
  static const cardDark = Color.fromRGBO(8, 2, 28, 1);
  static const pink = Color.fromARGB(225, 239, 1, 231);
}

abstract class _DarkColors {
  static const background = Color.fromRGBO(8, 2, 28, 1);
  static const card = BaseColors.cardDark;
}

abstract class BaseTheme {
  static const accentColor = BaseColors.purple;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        accentColor: accentColor,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: BaseColors.textLigth),
        backgroundColor: _DarkColors.background,
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: BaseColors.textLigth),
        ),
      );
}