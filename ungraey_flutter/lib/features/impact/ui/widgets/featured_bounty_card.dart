import 'package:flutter/material.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import 'featured_bounty_banner.dart';

/// Horizontal card for high-urgency commodity bounties.
class FeaturedBountyCard extends StatefulWidget {
  final String title;
  final MaterialCategory category;
  final String distance;
  final String reward;
  final String quantity;
  final VoidCallback onTap;

  const FeaturedBountyCard({
    super.key,
    required this.title,
    required this.category,
    required this.distance,
    required this.reward,
    required this.quantity,
    required this.onTap,
  });

  @override
  State<FeaturedBountyCard> createState() => _FeaturedBountyCardState();
}

class _FeaturedBountyCardState extends State<FeaturedBountyCard> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return ScaleClickWrapper(
      onPressed: widget.onTap,
      borderRadius: 18,
      child: Container(
        width: 210,
        height: 180,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: pure.cardGradient,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: pure.borderSubtle.withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeaturedBountyBanner(
              emoji: widget.category.emoji,
              distance: widget.distance,
              isBookmarked: _isBookmarked,
              onBookmarkToggle: () =>
                  setState(() => _isBookmarked = !_isBookmarked),
            ),

            // Content Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: pure.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          '${widget.category.displayName} • ${widget.quantity}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: pure.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    // Bottom Reward Pill
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF10B981,
                            ).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: AppText(
                            widget.reward,
                            style: const TextStyle(
                              color: Color(0xFF10B981),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                          color: pure.textMuted,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
