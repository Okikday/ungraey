import 'package:flutter/material.dart';
import 'pure_theme_extension.dart';

/// Dark mode instance of [PureThemeExtension] tailored for Ungraey.
class PureDarkThemeExtension extends PureThemeExtension {
  const PureDarkThemeExtension()
      : super(
          brightness: Brightness.dark,
          primary: const Color(0xFF10B981),
          secondary: const Color(0xFFF59E0B),
          scaffoldBackground: const Color(0xFF0D1210),
          surface: const Color(0xFF141B17),
          surfaceElevated: const Color(0xFF1B241F),
          card: const Color(0xFF161F1A),
          textPrimary: const Color(0xFFF3F7F5),
          textSecondary: const Color(0xFFA3B6AC),
          textMuted: const Color(0xFF6E8276),
          border: const Color(0xFF25332A),
          borderSubtle: const Color(0x403A4E42),
          error: const Color(0xFFEF4444),
          success: const Color(0xFF10B981),
          cardGradient: const LinearGradient(
            colors: [Color(0xFF1C2621), Color(0xFF111714)],
            stops: [0.54, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        );
}
