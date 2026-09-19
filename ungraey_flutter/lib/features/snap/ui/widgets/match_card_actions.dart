import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/snap_pod.dart';
import '../actions/snap_actions.dart';

/// Action buttons for the instant match card: handoff, retake, and listing.
class MatchCardActions extends ConsumerWidget {
  const MatchCardActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final state = ref.watch(SnapPod.me);

    if (state.matchingBounties.isEmpty) return const SizedBox.shrink();
    final topBounty = state.matchingBounties.first;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
        const SizedBox(height: 8),
        ScaleClickWrapper(
          onPressed: () => SnapActions.listPileForSale(context, ref),
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: pure.surfaceHighlight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: pure.borderSubtle.withValues(alpha: 0.3),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'List this pile for sale',
              style: TextStyle(
                color: pure.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
