import 'package:flutter/material.dart';
import '../theme/pure_theme_extension.dart';

/// Symmetrical outward gradient footer with reactive center pill.
class GradientFooter extends StatelessWidget {
  final bool hasNext;
  final VoidCallback? onPullNext;
  final String label;

  const GradientFooter({
    super.key,
    this.hasNext = false,
    this.onPullNext,
    this.label = 'End of Feed',
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    pure.borderSubtle.withValues(alpha: 0.35),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onPullNext,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: pure.surface.blendColor(pure.primary, 0.06),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: hasNext
                      ? pure.primary.withValues(alpha: 0.4)
                      : pure.borderSubtle.withValues(alpha: 0.25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    hasNext
                        ? Icons.keyboard_double_arrow_down_rounded
                        : Icons.check_circle_outline_rounded,
                    size: 14,
                    color: hasNext ? pure.primary : pure.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      color: hasNext ? pure.textPrimary : pure.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    pure.borderSubtle.withValues(alpha: 0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
