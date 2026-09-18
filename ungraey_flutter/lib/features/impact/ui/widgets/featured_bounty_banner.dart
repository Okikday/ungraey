import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../shared/components/blurred_tag.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Top preview banner for featured bounty cards showing category emoji and distance.
class FeaturedBountyBanner extends StatelessWidget {
  final String emoji;
  final String distance;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const FeaturedBountyBanner({
    super.key,
    required this.emoji,
    required this.distance,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Container(
      height: 78,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: pure.surfaceElevated.withValues(alpha: 0.6),
        border: Border(
          bottom: BorderSide(
            color: pure.borderSubtle.withValues(alpha: 0.2),
            width: 0.8,
          ),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 36),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: BlurredTag(
              label: distance,
              iconData: Iconsax.location_copy,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ScaleClickWrapper(
              onPressed: () {
                HapticFeedback.selectionClick();
                onBookmarkToggle();
              },
              borderRadius: 100,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: isBookmarked
                      ? pure.primary.withValues(alpha: 0.2)
                      : pure.surface.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isBookmarked ? Iconsax.bookmark : Iconsax.bookmark_copy,
                  size: 14,
                  color: isBookmarked ? pure.primary : pure.textMuted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
