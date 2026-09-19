import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../shared/components/k_curves.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Animated multi-arc custom painted dial gauge visualizer.
class EcoDialGauge extends StatefulWidget {
  final double kgDiverted;
  final double co2eAvoided;
  final double treesEquivalent;

  const EcoDialGauge({
    super.key,
    required this.kgDiverted,
    required this.co2eAvoided,
    required this.treesEquivalent,
  });

  @override
  State<EcoDialGauge> createState() => _EcoDialGaugeState();
}

class _EcoDialGaugeState extends State<EcoDialGauge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: KCurves.bouncySpring,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final progress = _animation.value;
        final currentKg = (widget.kgDiverted * progress).toStringAsFixed(1);
        final currentCo2 = (widget.co2eAvoided * progress).toStringAsFixed(1);

        return SizedBox(
          width: 260,
          height: 260,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(260, 260),
                painter: _RingPainter(
                  kgProgress:
                      (widget.kgDiverted / 100).clamp(0.0, 1.0) * progress,
                  co2Progress:
                      (widget.co2eAvoided / 150).clamp(0.0, 1.0) * progress,
                  treeProgress:
                      (widget.treesEquivalent / 10).clamp(0.0, 1.0) * progress,
                  primaryColor: pure.primary,
                  secondaryColor: pure.secondary,
                  trackColor: pure.surfaceHighlight,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$currentKg kg',
                    style: TextStyle(
                      color: pure.textPrimary,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                  Text(
                    'LANDFILL DIVERTED',
                    style: TextStyle(
                      color: pure.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: pure.secondary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      '🌿 $currentCo2 kg CO2e Avoided',
                      style: TextStyle(
                        color: pure.secondary,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  final double kgProgress;
  final double co2Progress;
  final double treeProgress;
  final Color primaryColor;
  final Color secondaryColor;
  final Color trackColor;

  const _RingPainter({
    required this.kgProgress,
    required this.co2Progress,
    required this.treeProgress,
    required this.primaryColor,
    required this.secondaryColor,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    _drawArc(canvas, center, 116, 12, trackColor, 1.0);
    _drawArc(canvas, center, 116, 12, primaryColor, kgProgress);

    _drawArc(canvas, center, 98, 9, trackColor, 1.0);
    _drawArc(canvas, center, 98, 9, const Color(0xFF06B6D4), co2Progress);

    _drawArc(canvas, center, 82, 7, trackColor, 1.0);
    _drawArc(canvas, center, 82, 7, secondaryColor, treeProgress);
  }

  void _drawArc(
    Canvas c,
    Offset center,
    double r,
    double w,
    Color color,
    double p,
  ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = w
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    c.drawArc(
      Rect.fromCircle(center: center, radius: r),
      -pi / 2,
      2 * pi * p.clamp(0.0, 1.0),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.kgProgress != kgProgress ||
      old.co2Progress != co2Progress ||
      old.treeProgress != treeProgress;
}
