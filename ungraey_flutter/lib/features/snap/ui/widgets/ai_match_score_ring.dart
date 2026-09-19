import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Animated circular arc ring visualising AI material match confidence (0–100).
/// Conforms to Aura Design System §17 — Eco-Dial spring interpolation.
class AiMatchScoreRing extends StatefulWidget {
  final double score; // 0.0 – 1.0
  final double size;

  const AiMatchScoreRing({
    super.key,
    required this.score,
    this.size = 54,
  });

  @override
  State<AiMatchScoreRing> createState() => _AiMatchScoreRingState();
}

class _AiMatchScoreRingState extends State<AiMatchScoreRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _arcAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _arcAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Cubic(0.175, 0.885, 0.32, 1.275), // bouncySpring
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.forward());
  }

  @override
  void didUpdateWidget(AiMatchScoreRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.score != widget.score) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final pct = (widget.score * 100).round();

    return AnimatedBuilder(
      animation: _arcAnimation,
      builder: (context, _) {
        final animatedScore = widget.score * _arcAnimation.value;
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _RingPainter(
                  progress: animatedScore,
                  trackColor: pure.border,
                  arcColor: pure.primary,
                  glowColor: pure.primary.withValues(alpha: 0.35),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$pct%',
                    style: TextStyle(
                      color: pure.textPrimary,
                      fontSize: widget.size * 0.20,
                      fontWeight: FontWeight.w800,
                      fontFeatures: const [FontFeature.tabularFigures()],
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    'match',
                    style: TextStyle(
                      color: pure.textMuted,
                      fontSize: widget.size * 0.11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).animate().fadeIn(duration: 150.ms);
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color trackColor;
  final Color arcColor;
  final Color glowColor;

  const _RingPainter({
    required this.progress,
    required this.trackColor,
    required this.arcColor,
    required this.glowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 10) / 2;
    const strokeWidth = 3.0;
    const startAngle = -pi / 2;

    // Track ring
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * pi,
      false,
      Paint()
        ..color = trackColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    if (progress <= 0) return;

    // Glow layer
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * pi * progress,
      false,
      Paint()
        ..color = glowColor
        ..strokeWidth = strokeWidth + 3
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    // Arc with gradient shader
    final gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + 2 * pi * progress,
      colors: [arcColor.withValues(alpha: 0.6), arcColor],
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * pi * progress,
      false,
      Paint()
        ..shader = gradient.createShader(
          Rect.fromCircle(center: center, radius: radius),
        )
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.arcColor != arcColor;
}
