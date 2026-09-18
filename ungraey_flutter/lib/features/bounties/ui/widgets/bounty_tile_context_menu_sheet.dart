import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../actions/bounties_actions.dart';

/// Context menu modal sheet presenting actions for a specific bounty tile.
class BountyTileContextMenuSheet extends StatelessWidget {
  final Bounty bounty;

  const BountyTileContextMenuSheet({super.key, required this.bounty});

  static Future<void> show(BuildContext context, {required Bounty bounty}) {
    final pure = context.pureTheme;
    return showModalBottomSheet(
      context: context,
      backgroundColor: pure.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => BountyTileContextMenuSheet(bounty: bounty),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        14,
        20,
        MediaQuery.paddingOf(context).bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 38,
            height: 4,
            decoration: BoxDecoration(
              color: pure.textMuted.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Title
          AppText(
            bounty.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: pure.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),

          _ActionRow(
            icon: Iconsax.direct_send_copy,
            label: 'View Full Details & Claim',
            iconColor: pure.primary,
            onTap: () {
              Navigator.pop(context);
              BountiesActions.openBountyDetails(context, bounty.id ?? 1);
            },
          ),
          _ActionRow(
            icon: Iconsax.share_copy,
            label: 'Share Commodity Bounty',
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bounty link copied to clipboard!'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
          _ActionRow(
            icon: Iconsax.bookmark_copy,
            label: 'Save to Watchlist',
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Saved to your material watchlist!'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final VoidCallback onTap;

  const _ActionRow({
    required this.icon,
    required this.label,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return ScaleClickWrapper(
      onPressed: onTap,
      borderRadius: 12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor ?? pure.textPrimary),
            const SizedBox(width: 14),
            Expanded(
              child: AppText(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: pure.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
