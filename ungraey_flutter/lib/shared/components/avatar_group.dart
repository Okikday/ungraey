import 'package:flutter/material.dart';
import '../theme/pure_theme_extension.dart';
import 'app_text.dart';

/// Overlapping stacked avatar circles with hairline borders and extra indicator.
class AvatarGroup extends StatelessWidget {
  final List<String> initials;
  final int extraCount;
  final Color? borderColor;
  final double circleSize;

  const AvatarGroup({
    super.key,
    required this.initials,
    this.extraCount = 0,
    this.borderColor,
    this.circleSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final strokeColor = borderColor ?? pure.surface;

    final visible = initials.take(3).toList();

    return SizedBox(
      height: circleSize,
      width:
          (visible.length * (circleSize * 0.72)) +
          (extraCount > 0 ? (circleSize * 0.72) : (circleSize * 0.28)),
      child: Stack(
        children: [
          for (int i = 0; i < visible.length; i++)
            Positioned(
              left: i * (circleSize * 0.72),
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  color: pure.primary.withValues(alpha: 0.2 + (i * 0.15)),
                  shape: BoxShape.circle,
                  border: Border.all(color: strokeColor, width: 1.5),
                ),
                alignment: Alignment.center,
                child: AppText(
                  visible[i],
                  style: TextStyle(
                    fontSize: circleSize * 0.42,
                    fontWeight: FontWeight.w700,
                    color: pure.textPrimary,
                  ),
                ),
              ),
            ),
          if (extraCount > 0)
            Positioned(
              left: visible.length * (circleSize * 0.72),
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  color: pure.surfaceElevated,
                  shape: BoxShape.circle,
                  border: Border.all(color: strokeColor, width: 1.5),
                ),
                alignment: Alignment.center,
                child: AppText(
                  '+$extraCount',
                  style: TextStyle(
                    fontSize: circleSize * 0.38,
                    fontWeight: FontWeight.w700,
                    color: pure.textMuted,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
