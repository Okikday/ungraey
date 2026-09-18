import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/snap_pod.dart';

/// Renders corner reticles, animated scanning laser line, and AR material bounding boxes.
class CameraViewfinderHud extends ConsumerStatefulWidget {
  const CameraViewfinderHud({super.key});

  @override
  ConsumerState<CameraViewfinderHud> createState() => _CameraViewfinderHudState();
}

class _CameraViewfinderHudState extends ConsumerState<CameraViewfinderHud>
    with SingleTickerProviderStateMixin {
  late final AnimationController _laserController;

  @override
  void initState() {
    super.initState();
    _laserController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _laserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final state = ref.watch(SnapPod.me);

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Stack(
          children: [
            // Dark gradient vignette
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.9,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.65),
                    ],
                  ),
                ),
              ),
            ),

            // Corner brackets
            Positioned(
              left: 28,
              top: 36,
              right: 28,
              bottom: 120,
              child: CustomPaint(
                painter: _CornerBracketPainter(color: pure.primary),
              ),
            ),

            // Translating laser sweep line
            if (state.isScanning && !state.hasCaptured)
              AnimatedBuilder(
                animation: _laserController,
                builder: (context, _) {
                  final top = 36 + (h - 156) * _laserController.value;
                  return Positioned(
                    left: 28,
                    right: 28,
                    top: top,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            pure.primary.withValues(alpha: 0.85),
                            Colors.transparent,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: pure.primary.withValues(alpha: 0.6),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

            // AR Detected Bounding Boxes
            for (final region in state.detectedRegions)
              Positioned(
                left: region.normalizedRect.left * w,
                top: region.normalizedRect.top * (h - 120),
                width: region.normalizedRect.width * w,
                height: region.normalizedRect.height * (h - 120),
                child: _BoundingBoxOverlay(
                  label:
                      '${region.category.emoji} ${region.category.displayName} • ${(region.confidence * 100).toInt()}%',
                ),
              ),
          ],
        );
      },
    );
  }
}

class _BoundingBoxOverlay extends StatelessWidget {
  final String label;
  const _BoundingBoxOverlay({required this.label});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: pure.primary, width: 1.5),
        borderRadius: BorderRadius.circular(8),
        color: pure.primary.withValues(alpha: 0.08),
      ),
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: pure.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _CornerBracketPainter extends CustomPainter {
  final Color color;
  const _CornerBracketPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const len = 28.0;

    // Top-Left
    canvas.drawLine(const Offset(0, 0), const Offset(len, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, len), paint);

    // Top-Right
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - len, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, len), paint);

    // Bottom-Left
    canvas.drawLine(Offset(0, size.height), Offset(len, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - len), paint);

    // Bottom-Right
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - len, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - len), paint);
  }

  @override
  bool shouldRepaint(covariant _CornerBracketPainter old) => old.color != color;
}
