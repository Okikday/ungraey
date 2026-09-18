import 'package:flutter/material.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Live community counter ticker showing aggregated network diversion.
class CommunityCounterTicker extends StatelessWidget {
  final double totalKg;
  final int totalHandoffs;

  const CommunityCounterTicker({
    super.key,
    required this.totalKg,
    required this.totalHandoffs,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: pure.surfaceHighlight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: pure.borderSubtle.withValues(alpha: 0.28),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF10B981),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'COMMUNITY NETWORK DIVERSION',
                style: TextStyle(
                  color: pure.textMuted,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${totalKg.toStringAsFixed(1)} kg',
            style: TextStyle(
              color: pure.primary,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Kept out of local landfills across $totalHandoffs successful handoffs',
            style: TextStyle(color: pure.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
