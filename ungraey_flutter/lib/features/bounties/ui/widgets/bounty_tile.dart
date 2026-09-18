import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/blurred_tag.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import 'bounty_tile_context_menu_sheet.dart';

/// Inset list tile for a community commodity bounty.
class BountyTile extends StatelessWidget {
  final Bounty bounty;
  final VoidCallback onTap;

  const BountyTile({
    super.key,
    required this.bounty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final rewardText = bounty.rewardType == RewardType.trade
        ? 'Trade'
        : '\$${(bounty.rewardAmountCents / 100).toStringAsFixed(2)}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onLongPress: () {
          HapticFeedback.selectionClick();
          BountyTileContextMenuSheet.show(context, bounty: bounty);
        },
        child: ScaleClickWrapper(
          onPressed: onTap,
          borderRadius: 16,
          child: Container(
            height: 68,
            decoration: BoxDecoration(
              color: pure.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: pure.borderSubtle.withValues(alpha: 0.22),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                // Commodity Icon Avatar
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: pure.surfaceElevated,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: pure.borderSubtle.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    bounty.category.emoji,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 12),

                // Title & Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        bounty.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color: pure.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      AppText(
                        '${bounty.creatorName} • ${bounty.quantityNeeded} needed',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: pure.textMuted,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                // Trailing Reward & Distance
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: AppText(
                        rewardText,
                        style: const TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 11.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    const BlurredTag(
                      label: '1.4 mi',
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: pure.textMuted.withValues(alpha: 0.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
