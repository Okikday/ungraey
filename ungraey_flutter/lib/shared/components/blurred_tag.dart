import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/pure_theme_extension.dart';
import 'app_text.dart';

/// Frosted glass micro-tag with decal blur and tactile geometry.
class BlurredTag extends StatelessWidget {
  final String label;
  final IconData? iconData;
  final Color? customColor;
  final bool usePrimaryColor;

  const BlurredTag({
    super.key,
    required this.label,
    this.iconData,
    this.customColor,
    this.usePrimaryColor = false,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final fgColor =
        customColor ?? (usePrimaryColor ? Colors.white : pure.textPrimary);
    final bgColor = customColor != null
        ? customColor!.withValues(alpha: 0.18)
        : (usePrimaryColor
              ? pure.primary.withValues(alpha: 0.35)
              : pure.surfaceElevated.withValues(alpha: 0.55));

    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          height: 22,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color:
                  (customColor ??
                          (usePrimaryColor ? pure.primary : pure.borderSubtle))
                      .withValues(alpha: 0.28),
              width: 0.8,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconData != null) ...[
                Icon(iconData, size: 11, color: fgColor),
                const SizedBox(width: 4),
              ],
              AppText(
                label,
                style: TextStyle(
                  color: fgColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
