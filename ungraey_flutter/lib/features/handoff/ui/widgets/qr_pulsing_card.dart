import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Renders a cryptographically unique QR token with a pulsing border and timer.
class QrPulsingCard extends StatelessWidget {
  final String qrData;
  final int secondsRemaining;

  const QrPulsingCard({
    super.key,
    required this.qrData,
    required this.secondsRemaining,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final mins = (secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final secs = (secondsRemaining % 60).toString().padLeft(2, '0');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Pulsing border container
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: pure.primary.withValues(alpha: 0.8),
              width: 2.5,
            ),
            boxShadow: [
              BoxShadow(
                color: pure.primary.withValues(alpha: 0.25),
                blurRadius: 24,
                spreadRadius: 4,
              ),
            ],
          ),
          child: QrImageView(
            data: qrData,
            version: QrVersions.auto,
            size: 200,
            eyeStyle: QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: pure.scaffoldBackground,
            ),
            dataModuleStyle: QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: pure.scaffoldBackground,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Countdown Timer Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: pure.surfaceHighlight,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: secondsRemaining < 30
                  ? pure.error.withValues(alpha: 0.4)
                  : pure.borderSubtle.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.timer_outlined,
                size: 14,
                color: secondsRemaining < 30 ? pure.error : pure.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                '$mins:$secs remaining',
                style: TextStyle(
                  color: secondsRemaining < 30
                      ? pure.error
                      : pure.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
