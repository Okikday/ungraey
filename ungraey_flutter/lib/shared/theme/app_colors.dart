import 'package:flutter/material.dart';

/// Central color definitions and color math extensions.
class AppColors {
  const AppColors._();

  // Ungraey Core Palette
  static const Color primary = Color(0xFF10B981); // Luminous Emerald
  static const Color primaryDark = Color(0xFF059669);
  static const Color secondary = Color(0xFFF59E0B); // Radiant Amber
  static const Color accentIndigo = Color(0xFF5375F6); // Deep Indigo
  static const Color accentViolet = Color(0xFF4B24D2);

  // Backgrounds & Surfaces
  static const Color bgDark = Color(0xFF0D1210);
  static const Color bgLight = Color(0xFFF6F8F7);
  static const Color surfaceDark = Color(0xFF141B17);
  static const Color surfaceDarkElevated = Color(0xFF1B241F);
  static const Color cardDark = Color(0xFF161F1A);

  // Common Constants
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

/// Helper extension on [Color] for dynamic surface tinting and depth blending.
extension AppColorMathExtension on Color {
  Color lightenColor([double? value]) =>
      HSLColor.fromColor(this).withLightness((value ?? 0.9)).toColor();

  Color blendColor(Color other, [double? value]) =>
      Color.lerp(this, other, value ?? 0.5) ?? this;
}
