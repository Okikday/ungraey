import 'package:flutter/material.dart';
import '../theme/pure_theme_extension.dart';

/// Pill badge for ecological stats and reward tokens.
class EcoBadge extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? customColor;
  final bool isSecondary;

  const EcoBadge({
    super.key,
    required this.label,
    this.icon,
    this.customColor,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final color = customColor ?? (isSecondary ? pure.secondary : pure.primary);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withValues(alpha: 0.32), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
