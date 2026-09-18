import 'package:flutter/material.dart';
import 'pure_theme_extension.dart';

/// Light mode instance of [PureThemeExtension] tailored for Ungraey.
class PureLightThemeExtension extends PureThemeExtension {
  const PureLightThemeExtension()
    : super(
        brightness: Brightness.light,
        primary: const Color(0xFF059669),
        secondary: const Color(0xFFD97706),
        scaffoldBackground: const Color(0xFFF6FAF7),
        surface: const Color(0xFFFFFFFF),
        surfaceElevated: const Color(0xFFFFFFFF),
        card: const Color(0xFFFFFFFF),
        textPrimary: const Color(0xFF0F1713),
        textSecondary: const Color(0xFF47584E),
        textMuted: const Color(0xFF7E9287),
        border: const Color(0xFFDCE6DF),
        borderSubtle: const Color(0x33059669),
        error: const Color(0xFFDC2626),
        success: const Color(0xFF059669),
        cardGradient: const LinearGradient(
          colors: [Color(0xFFF0F7F3), Color(0x26059669)],
          stops: [0.54, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );
}
