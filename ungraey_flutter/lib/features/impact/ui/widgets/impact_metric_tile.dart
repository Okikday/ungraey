import 'package:flutter/material.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Card tile highlighting a specific environmental equivalency metric.
class ImpactMetricTile extends StatelessWidget {
  final String title;
  final String value;
  final String equivalence;
  final IconData icon;
  final Color? color;

  const ImpactMetricTile({
    super.key,
    required this.title,
    required this.value,
    required this.equivalence,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final effectiveColor = color ?? pure.primary;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: pure.surface.blendColor(effectiveColor, 0.06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: effectiveColor.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: effectiveColor.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: effectiveColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: pure.textMuted, fontSize: 12),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: pure.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  equivalence,
                  style: TextStyle(
                    color: effectiveColor,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
