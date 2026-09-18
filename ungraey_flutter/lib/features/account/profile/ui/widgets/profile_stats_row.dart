import 'package:flutter/material.dart';
import '../../../../../shared/theme/pure_theme_extension.dart';

/// Row of statistical badges for transactions, reputation, and local trust.
class ProfileStatsRow extends StatelessWidget {
  final int completedHandoffs;
  final double rating;

  const ProfileStatsRow({
    super.key,
    required this.completedHandoffs,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: _StatBox(
            label: 'Completed Handoffs',
            value: '$completedHandoffs deals',
            icon: Icons.swap_calls_rounded,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatBox(
            label: 'Neighbor Trust Rating',
            value: '⭐ ${rating.toStringAsFixed(1)} / 5.0',
            icon: Icons.verified_user_rounded,
          ),
        ),
      ],
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatBox({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: pure.surfaceHighlight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: pure.borderSubtle.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: pure.primary),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: pure.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(color: pure.textMuted, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
