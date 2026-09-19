import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/impact_pod.dart';

/// Neighborhood diversion leaderboard ranking nearby upcyclers.
///
/// Seeds nearby neighbors around the live user stats so the table always
/// feels competitive, driving repeat handoffs and community bragging rights.
class CommunityLeaderboardSection extends ConsumerWidget {
  const CommunityLeaderboardSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final state = ref.watch(ImpactPod.me);

    final userKg = state.userImpact.totalKgDiverted;
    final userHandoffs = state.userImpact.completedHandoffsCount;

    final entries = <(String, String, double, int, bool)>[
      ('Maya R.', '🎨', userKg + 34.6, userHandoffs + 5, false),
      ('Theo B.', '🔧', userKg + 11.3, userHandoffs + 2, false),
      ('You', '🌿', userKg, userHandoffs, true),
      ('Priya S.', '🪴', (userKg - 9.8).clamp(0.5, 9999), userHandoffs, false),
      ('Sam K.', '📚', (userKg - 21.4).clamp(0.5, 9999), userHandoffs - 1, false),
    ]..sort((a, b) => b.$3.compareTo(a.$3));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Neighborhood Leaderboard',
              style: TextStyle(
                color: pure.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: pure.surface.blendColor(pure.primary, 0.10),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: pure.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                '5-MILE RADIUS',
                style: TextStyle(
                  color: pure.primary,
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: pure.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: pure.borderSubtle.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < entries.length; i++) ...[
                _LeaderboardRow(rank: i + 1, entry: entries[i]),
                if (i < entries.length - 1)
                  Divider(
                    height: 1,
                    thickness: 0.6,
                    color: pure.borderSubtle.withValues(alpha: 0.3),
                    indent: 16,
                    endIndent: 16,
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _LeaderboardRow extends StatelessWidget {
  final int rank;
  final (String, String, double, int, bool) entry;

  const _LeaderboardRow({required this.rank, required this.entry});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final (name, emoji, kg, handoffs, isYou) = entry;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isYou
            ? pure.surface.blendColor(pure.primary, 0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              _rankLabel(rank),
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: pure.surfaceHighlight,
              border: Border.all(
                color: isYou
                    ? pure.primary.withValues(alpha: 0.5)
                    : pure.borderSubtle.withValues(alpha: 0.25),
              ),
            ),
            alignment: Alignment.center,
            child: Text(emoji, style: const TextStyle(fontSize: 17)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isYou ? pure.primary : pure.textPrimary,
                    fontSize: 13.5,
                    fontWeight: isYou ? FontWeight.w800 : FontWeight.w600,
                  ),
                ),
                Text(
                  '$handoffs handoffs',
                  style: TextStyle(
                    color: pure.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${kg.toStringAsFixed(1)} kg',
            style: TextStyle(
              color: pure.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}

/// Returns a medal emoji for podium ranks, plain number otherwise.
String _rankLabel(int rank) {
  switch (rank) {
    case 1:
      return '🥇';
    case 2:
      return '🥈';
    case 3:
      return '🥉';
    default:
      return '$rank';
  }
}
