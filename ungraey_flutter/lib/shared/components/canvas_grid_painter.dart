import 'package:flutter/material.dart';

/// Renders a subtle mathematical dot matrix across canvas backgrounds.
class CanvasGridPainter extends CustomPainter {
  final bool isDark;
  final double spacing;
  final double dotRadius;

  const CanvasGridPainter({
    required this.isDark,
    this.spacing = 32.0,
    this.dotRadius = 1.25,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final dotColor = isDark
        ? Colors.white.withValues(alpha: 0.05)
        : Colors.black.withValues(alpha: 0.04);

    final dotPaint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CanvasGridPainter oldDelegate) =>
      oldDelegate.isDark != isDark ||
      oldDelegate.spacing != spacing ||
      oldDelegate.dotRadius != dotRadius;
}
