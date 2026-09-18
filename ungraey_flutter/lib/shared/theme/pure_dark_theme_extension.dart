import 'package:flutter/material.dart';
import 'pure_theme_extension.dart';

/// Dark mode instance of [PureThemeExtension] tailored for Ungraey.
/// Surfaces are neutral-black; green lives only as the brand accent.
class PureDarkThemeExtension extends PureThemeExtension {
  const PureDarkThemeExtension()
    : super(
        brightness: Brightness.dark,
        primary: const Color(0xFF10B981),
        secondary: const Color(0xFFF59E0B),
        scaffoldBackground: const Color(0xFF0C0C0E),
        surface: const Color(0xFF141416),
        surfaceElevated: const Color(0xFF1C1C1F),
        card: const Color(0xFF181818),
        textPrimary: const Color(0xFFF2F2F7),
        textSecondary: const Color(0xFFA8A8B3),
        textMuted: const Color(0xFF6E6E7A),
        border: const Color(0xFF2C2C30),
        borderSubtle: const Color(0x3A3A3A50),
        error: const Color(0xFFEF4444),
        success: const Color(0xFF10B981),
        cardGradient: const LinearGradient(
          colors: [Color(0xFF1C1C1F), Color(0xFF111113)],
          stops: [0.54, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
      );
}
