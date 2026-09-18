import 'package:flutter/material.dart';

/// Aura card gradient theme extension.
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final LinearGradient cardGradient;

  const AppThemeExtension({required this.cardGradient});

  @override
  ThemeExtension<AppThemeExtension> copyWith({LinearGradient? cardGradient}) {
    return AppThemeExtension(cardGradient: cardGradient ?? this.cardGradient);
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    covariant ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      cardGradient:
          LinearGradient.lerp(cardGradient, other.cardGradient, t) ??
          cardGradient,
    );
  }

  static const light = <AppThemeExtension>[
    AppThemeExtension(
      cardGradient: LinearGradient(
        colors: [Color(0xFFF1F5F3), Color(0x33059669)],
        stops: [0.54, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ];

  static const dark = <AppThemeExtension>[
    AppThemeExtension(
      cardGradient: LinearGradient(
        colors: [Color(0xFF1E2622), Color(0xFF111714)],
        stops: [0.54, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      ),
    ),
  ];
}
