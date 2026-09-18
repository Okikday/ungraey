import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../logic/material_price_guide.dart';
import '../../providers/snap_pod.dart';
import '../actions/snap_actions.dart';
import 'ai_match_score_ring.dart';

/// Floating card presenting instant localized matching and potential cash earnings.
class InstantMatchCard extends ConsumerWidget {
  const InstantMatchCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final state = ref.watch(SnapPod.me);

    if (state.matchingBounties.isEmpty) return const SizedBox.shrink();

    final count = state.matchingBounties.length;
    final earningsDollars = (state.totalPotentialEarningsCents / 100)
        .toStringAsFixed(2);
    final topBounty = state.matchingBounties.first;
    final avgConfidence = state.detectedRegions.isEmpty
        ? 0.91
        : state.detectedRegions
                  .map((r) => r.confidence)
                  .reduce((a, b) => a + b) /
              state.detectedRegions.length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: pure.surface.blendColor(pure.primary, 0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: pure.primary.withValues(alpha: 0.35),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.22),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              AiMatchScoreRing(score: avgConfidence, size: 68),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'INSTANT 5-MILE MATCH',
                      style: TextStyle(
                        color: pure.primary,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Text(
                      '$count Local Buyers Need This Now',
                      style: TextStyle(
                        color: pure.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: pure.secondary.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: pure.secondary.withValues(alpha: 0.4),
                    width: 1,
                  ),
                ),
                child: Text(
                  '\$$earningsDollars',
                  style: TextStyle(
                    color: pure.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Top request from ${topBounty.creatorName}: "${topBounty.title}"',
            style: TextStyle(
              color: pure.textSecondary,
              fontSize: 12.5,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            'Market estimate ${MaterialPriceGuide.formatDollars(state.estimatedLowCents)}–${MaterialPriceGuide.formatDollars(state.estimatedHighCents)} • final price agreed at handoff',
            style: TextStyle(
              color: pure.textMuted,
              fontSize: 11.5,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ScaleClickWrapper(
                  onPressed: () =>
                      SnapActions.openMatchDetails(context, topBounty.id ?? 1),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: pure.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'View Match & Handoff',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ScaleClickWrapper(
                onPressed: () => SnapActions.retakeSnap(context, ref),
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: pure.surfaceHighlight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: pure.borderSubtle.withValues(alpha: 0.3),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Retake',
                    style: TextStyle(
                      color: pure.textSecondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
