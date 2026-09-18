import 'package:flutter/material.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Card tile presenting an active commodity bounty with distance and reward.
class BountyCard extends StatelessWidget {
  final Bounty bounty;
  final VoidCallback onTap;

  const BountyCard({
    super.key,
    required this.bounty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final cat = bounty.category;
    final progress = bounty.quantityNeeded > 0
        ? (bounty.quantityFulfilled / bounty.quantityNeeded).clamp(0.0, 1.0)
        : 0.0;

    return ScaleClickWrapper(
      scaleBetween: const (1.0, 0.97),
      onPressed: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: pure.surface.blendColor(pure.primary, 0.06),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: pure.borderSubtle.withValues(alpha: 0.25),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Category tag, Location, and Reward Badge
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: pure.surfaceHighlight,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(cat.emoji, style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 4),
                      Text(
                        cat.displayName,
                        style: TextStyle(
                          color: pure.textSecondary,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '• ${bounty.radiusMiles.toStringAsFixed(1)} mi',
                  style: TextStyle(color: pure.textMuted, fontSize: 11),
                ),
                const Spacer(),
                _RewardBadge(
                  type: bounty.rewardType,
                  cents: bounty.rewardAmountCents,
                  tradeDesc: bounty.tradeItemDescription,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Title and creator
            Text(
              bounty.title,
              style: TextStyle(
                color: pure.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              'Posted by ${bounty.creatorName} • ${bounty.addressSnippet}',
              style: TextStyle(color: pure.textMuted, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),

            // Progress bar & quantity
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      backgroundColor: pure.surfaceHighlight,
                      color: pure.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${bounty.quantityFulfilled}/${bounty.quantityNeeded} collected',
                  style: TextStyle(
                    color: pure.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RewardBadge extends StatelessWidget {
  final RewardType type;
  final int cents;
  final String? tradeDesc;

  const _RewardBadge({
    required this.type,
    required this.cents,
    this.tradeDesc,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final isCash = type == RewardType.cash;
    final color = isCash ? pure.secondary : pure.primary;
    final label = isCash
        ? '\$${(cents / 100).toStringAsFixed(2)}'
        : (type == RewardType.points ? '$cents PTS' : 'TRADE');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.35), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
