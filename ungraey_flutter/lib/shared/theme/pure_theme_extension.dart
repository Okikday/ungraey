import 'package:flutter/material.dart';
import 'pure_dark_theme_extension.dart';
import 'pure_light_theme_extension.dart';

/// Extension on [Color] providing Aura surface tinting blending.
extension ColorBlendExtension on Color {
  /// Blends this base color with [overlay] at alpha factor [factor] (0.0 to 1.0).
  Color blendColor(Color overlay, double factor) {
    return Color.lerp(this, overlay, factor.clamp(0.0, 1.0)) ?? this;
  }
}

/// Base theme extension defining core semantic tokens and major colors.
class PureThemeExtension extends ThemeExtension<PureThemeExtension> {
  const PureThemeExtension({
    required this.brightness,
    required this.primary,
    required this.secondary,
    required this.scaffoldBackground,
    required this.surface,
    required this.surfaceElevated,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.borderSubtle,
    required this.error,
    required this.success,
    required this.cardGradient,
  });

  final Brightness brightness;
  final Color primary;
  final Color secondary;
  final Color scaffoldBackground;
  final Color surface;
  final Color surfaceElevated;
  final Color card;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color border;
  final Color borderSubtle;
  final Color error;
  final Color success;
  final LinearGradient cardGradient;

  bool get isDark => brightness == Brightness.dark;

  @override
  Object get type => PureThemeExtension;

  @override
  PureThemeExtension copyWith({
    Brightness? brightness,
    Color? primary,
    Color? secondary,
    Color? scaffoldBackground,
    Color? surface,
    Color? surfaceElevated,
    Color? card,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? border,
    Color? borderSubtle,
    Color? error,
    Color? success,
    LinearGradient? cardGradient,
  }) {
    return PureThemeExtension(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      card: card ?? this.card,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      error: error ?? this.error,
      success: success ?? this.success,
      cardGradient: cardGradient ?? this.cardGradient,
    );
  }

  @override
  PureThemeExtension lerp(
    covariant ThemeExtension<PureThemeExtension>? other,
    double t,
  ) {
    if (other is! PureThemeExtension) return this;
    return PureThemeExtension(
      brightness: t < 0.5 ? brightness : other.brightness,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t) ??
          scaffoldBackground,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      surfaceElevated:
          Color.lerp(surfaceElevated, other.surfaceElevated, t) ??
          surfaceElevated,
      card: Color.lerp(card, other.card, t) ?? card,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      textMuted: Color.lerp(textMuted, other.textMuted, t) ?? textMuted,
      border: Color.lerp(border, other.border, t) ?? border,
      borderSubtle:
          Color.lerp(borderSubtle, other.borderSubtle, t) ?? borderSubtle,
      error: Color.lerp(error, other.error, t) ?? error,
      success: Color.lerp(success, other.success, t) ?? success,
      cardGradient:
          LinearGradient.lerp(cardGradient, other.cardGradient, t) ??
          cardGradient,
    );
  }
}

/// Auxiliary and non-main semantic colors exposed as getters on [PureThemeExtension].
extension PureThemeExtensionExtras on PureThemeExtension {
  // Surfaces & Overlays
  Color get surfaceCardAlpha =>
      isDark ? const Color(0xCC1A211D) : const Color(0xCCFFFFFF);
  Color get backgroundOverlay =>
      isDark ? const Color(0xB8090D0B) : const Color(0x66000000);
  Color get avatarBackground =>
      isDark ? const Color(0xFF222B25) : const Color(0xFFE8EFEA);
  Color get navBarBackground =>
      isDark ? const Color(0xE6131A16) : const Color(0xF0FFFFFF);
  Color get surfaceHighlight =>
      isDark ? const Color(0xFF242E28) : const Color(0xFFEFF5F0);

  // Badges & Indicators
  Color get badgeBackground =>
      isDark ? const Color(0x3310B981) : const Color(0xFFD1FAE5);
  Color get badgeText =>
      isDark ? const Color(0xFF34D399) : const Color(0xFF065F46);

  // Brand Accents
  Color get amberBadgeBackground =>
      isDark ? const Color(0x33F59E0B) : const Color(0xFFFEF3C7);
  Color get amberBadgeText =>
      isDark ? const Color(0xFFFBBF24) : const Color(0xFF92400E);

  // Typography & Subtleties
  Color get textSubtle =>
      isDark ? const Color(0xFF8C9B92) : const Color(0xFF6B7280);
  Color get textCategory =>
      isDark ? const Color(0xFF9EAEA4) : const Color(0xFF4B5563);

  // Alphas
  Color get whiteAlpha10 => const Color(0x1AFFFFFF);
  Color get whiteAlpha60 => const Color(0x99FFFFFF);
  Color get whiteAlpha80 => const Color(0xCCFFFFFF);
  Color get blackAlpha10 => const Color(0x1A000000);

  // Structural Dividers, Shadows & Tracks
  Color get shadow => const Color(0x40000000);
  Color get track =>
      isDark ? const Color(0x33526B5D) : const Color(0x1F000000);
  Color get divider =>
      isDark ? const Color(0xFF232D27) : const Color(0x1A284B38);
}

/// Extension on [ThemeData] to access [PureThemeExtension] via `theme.pure`.
extension ThemeDataPure on ThemeData {
  PureThemeExtension get pure =>
      extension<PureThemeExtension>() ??
      (brightness == Brightness.dark
          ? const PureDarkThemeExtension()
          : const PureLightThemeExtension());
}

/// Extension on [BuildContext] to access [PureThemeExtension] via `context.pureTheme`.
extension BuildContextPure on BuildContext {
  PureThemeExtension get pureTheme => Theme.of(this).pure;
}
