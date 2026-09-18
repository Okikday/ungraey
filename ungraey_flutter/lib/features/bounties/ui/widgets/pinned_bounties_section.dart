import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/section_header.dart';
import '../../providers/bounties_pod.dart';
import '../actions/bounties_actions.dart';
import 'pinned_bounty_card.dart';

/// Horizontal carousel displaying pinned high-priority commodity bounties.
class PinnedBountiesSection extends ConsumerWidget {
  const PinnedBountiesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bounties = ref.watch(BountiesPod.me.select((s) => s.bounties));
    final pinned = bounties.take(4).toList();

    if (pinned.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'High Urgency Bounties'),
        const SizedBox(height: 8),
        SizedBox(
          height: 86,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: pinned.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final bounty = pinned[index];
              return PinnedBountyCard(
                bounty: bounty,
                onTap: () =>
                    BountiesActions.openBountyDetails(context, bounty.id ?? 1),
              );
            },
          ),
        ),
      ],
    );
  }
}
