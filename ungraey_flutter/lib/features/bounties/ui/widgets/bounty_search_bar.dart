import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/bounties_pod.dart';
import '../actions/bounties_actions.dart';

/// Inset search bar with inline icon and proximity filter trigger.
class BountySearchBar extends ConsumerWidget {
  const BountySearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: pure.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: pure.borderSubtle.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Icon(
              Iconsax.search_normal_copy,
              size: 18,
              color: pure.textMuted,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: (q) =>
                    ref.read(BountiesPod.me.notifier).updateSearch(q),
                style: TextStyle(
                  color: pure.textPrimary,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Search cardboard, glass jars, wood...',
                  hintStyle: TextStyle(
                    color: pure.textMuted,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            ScaleClickWrapper(
              onPressed: () => BountiesActions.openRadiusFilter(context, ref),
              borderRadius: 8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: pure.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Iconsax.setting_4_copy,
                  size: 16,
                  color: pure.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
