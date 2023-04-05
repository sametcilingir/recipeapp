import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeHandler {
  final ThemeData themeLight = FlexThemeData.light(
    useMaterial3: true,
    scheme: FlexScheme.deepBlue,
    textTheme: GoogleFonts.exoTextTheme(
      ThemeData.light(
        useMaterial3: true,
      ).textTheme,
    ),
  );

  final ThemeData themeDark = FlexThemeData.dark(
    useMaterial3: true,
    scheme: FlexScheme.deepBlue,
    textTheme: GoogleFonts.exoTextTheme(
      ThemeData.dark(
        useMaterial3: true,
      ).textTheme,
    ),
  );
}
