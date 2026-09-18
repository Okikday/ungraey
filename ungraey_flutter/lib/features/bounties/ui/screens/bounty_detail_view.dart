import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../network/api.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../../handoff/ui/actions/handoff_actions.dart';
import '../../providers/bounties_pod.dart';

/// Modal bottom sheet presenting full details and handoff action for a bounty.
class BountyDetailModal extends ConsumerWidget {
  final int bountyId;

  const BountyDetailModal({super.key, required this.bountyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final bounties = ref.watch(BountiesPod.me.select((s) => s.bounties));
    final bounty = bounties.firstWhere(
      (b) => b.id == bountyId,
      orElse: () => bounties.isNotEmpty
          ? bounties.first
          : Api.mockBounties.firstWhere(
              (b) => b.id == bountyId,
              orElse: () => Api.mockBounties.first,
            ),
    );

    final cat = bounty.category;
    final isCash = bounty.rewardType.name == 'cash';
    final rewardText = isCash
        ? '\$${(bounty.rewardAmountCents / 100).toStringAsFixed(2)} Cash Payout'
        : 'Direct Item Trade: ${bounty.tradeItemDescription ?? "Art Piece"}';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: pure.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: pure.borderSubtle.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Header Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: pure.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Text(cat.emoji, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bounty.title,
                      style: TextStyle(
                        color: pure.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'By ${bounty.creatorName} • ${bounty.addressSnippet}',
                      style: TextStyle(color: pure.textMuted, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Reward Callout
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: pure.surfaceHighlight,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: pure.primary.withValues(alpha: 0.25),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isCash
                      ? Icons.monetization_on_rounded
                      : Icons.swap_horiz_rounded,
                  color: pure.primary,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    rewardText,
                    style: TextStyle(
                      color: pure.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            'About this bounty',
            style: TextStyle(
              color: pure.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            bounty.description,
            style: TextStyle(
              color: pure.textSecondary,
              fontSize: 13.5,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),

          // Handoff CTA
          ScaleClickWrapper(
            onPressed: () {
              Navigator.pop(context);
              HandoffActions.openShowQr(context, bounty.id ?? 1);
            },
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: pure.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Generate Handoff QR Code',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
