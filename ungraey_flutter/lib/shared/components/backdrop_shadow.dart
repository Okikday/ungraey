import 'dart:ui';
import 'package:flutter/material.dart';

/// Renders a non-linear gradient shadow mask with decal blur.
/// Content scrolling underneath dissolves naturally into the background.
class BackdropShadow extends StatelessWidget {
  final double height;
  final (Alignment from, Alignment to) shadowDirection;
  final bool applyBlur;
  final Color? color;

  const BackdropShadow({
    super.key,
    required this.height,
    this.shadowDirection = const (Alignment.bottomCenter, Alignment.topCenter),
    this.applyBlur = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.scaffoldBackgroundColor;
    final gradientProps = _computeGradientProps(effectiveColor);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
          tileMode: TileMode.decal,
        ),
        enabled: applyBlur,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: shadowDirection.$1,
              end: shadowDirection.$2,
              colors: gradientProps.$1,
              stops: gradientProps.$2,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            height: height,
            color: effectiveColor,
          ),
        ),
      ),
    );
  }

  /// 10-stop progressive alpha curve preventing linear banding
  (List<Color>, List<double>) _computeGradientProps(Color color) {
    return (
      [for (int i = 0; i < 10; i++) color.withValues(alpha: 1.0 - (i * 0.1))],
      [for (int i = 0; i < 10; i++) i * 0.1],
    );
  }
}
