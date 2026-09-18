import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme_extension.dart';
import 'pure_dark_theme_extension.dart';
import 'pure_light_theme_extension.dart';

/// Central theme builder creating Aura ThemeData for light and dark modes.
class AppTheme {
  const AppTheme._();

  static ThemeData get dark {
    const pureDark = PureDarkThemeExtension();
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: pureDark.scaffoldBackground,
      colorScheme: ColorScheme.dark(
        primary: pureDark.primary,
        secondary: pureDark.secondary,
        surface: pureDark.surface,
        error: pureDark.error,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: pureDark.textPrimary,
        displayColor: pureDark.textPrimary,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        pureDark,
        ...AppThemeExtension.dark,
      ],
    );
  }

  static ThemeData get light {
    const pureLight = PureLightThemeExtension();
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: pureLight.scaffoldBackground,
      colorScheme: ColorScheme.light(
        primary: pureLight.primary,
        secondary: pureLight.secondary,
        surface: pureLight.surface,
        error: pureLight.error,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.light().textTheme,
      ).apply(
        bodyColor: pureLight.textPrimary,
        displayColor: pureLight.textPrimary,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        pureLight,
        ...AppThemeExtension.light,
      ],
    );
  }
}
