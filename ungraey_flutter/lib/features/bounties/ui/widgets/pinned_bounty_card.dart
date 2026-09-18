import 'package:flutter/material.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/avatar_group.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Horizontal squircle card for pinned demand-side bounties.
class PinnedBountyCard extends StatelessWidget {
  final Bounty bounty;
  final VoidCallback onTap;

  const PinnedBountyCard({
    super.key,
    required this.bounty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final cardBg = pure.primary.blendColor(pure.scaffoldBackground, 0.4);

    return ScaleClickWrapper(
      onPressed: onTap,
      borderRadius: 20,
      child: Container(
        width: 242,
        height: 82,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: pure.borderSubtle.withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left Emoji/Icon Box
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: pure.surface.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: pure.primary.withValues(alpha: 0.3),
                  width: 1.2,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                bounty.category.emoji,
                style: const TextStyle(fontSize: 26),
              ),
            ),
            const SizedBox(width: 10),

            // Details Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    bounty.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      AvatarGroup(
                        initials: const ['SA', 'MB'],
                        extraCount: 2,
                        borderColor: cardBg,
                        circleSize: 18,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: AppText(
                          '\$${(bounty.rewardAmountCents / 100).toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Color(0xFF10B981),
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
