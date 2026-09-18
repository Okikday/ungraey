import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/components/section_header.dart';
import '../../../bounties/ui/actions/bounties_actions.dart';
import '../../../main/providers/main_pod.dart';
import '../../../main/providers/main_state.dart';
import 'featured_bounty_card.dart';

/// Section rendering the high-demand commodity bounties horizontal carousel.
class FeaturedBountiesSection extends ConsumerWidget {
  const FeaturedBountiesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'High-Demand Bounties',
          actionLabel: 'See all',
          onActionTap: () {
            ref.read(MainPod.me.notifier).selectTab(MainTabEntry.bounties);
          },
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              FeaturedBountyCard(
                title: 'Need 50 Clean Glass Jars',
                category: MaterialCategory.cleanGlassJars,
                distance: '1.2 mi',
                reward: '\$10.00 Cash',
                quantity: '50 items',
                onTap: () => BountiesActions.openBountyDetails(context, 1),
              ),
              const SizedBox(width: 12),
              FeaturedBountyCard(
                title: 'Infinite Intact Moving Boxes',
                category: MaterialCategory.corrugatedCardboard,
                distance: '0.8 mi',
                reward: '\$25.00 Cash',
                quantity: '100 items',
                onTap: () => BountiesActions.openBountyDetails(context, 2),
              ),
              const SizedBox(width: 12),
              FeaturedBountyCard(
                title: 'Clean Scrap Denim Textiles',
                category: MaterialCategory.scrapDenimTextiles,
                distance: '2.4 mi',
                reward: 'Trade Tote',
                quantity: '15 lbs',
                onTap: () => BountiesActions.openBountyDetails(context, 3),
              ),
              const SizedBox(width: 12),
              FeaturedBountyCard(
                title: 'Untreated Pallet Wood',
                category: MaterialCategory.treatedLumber,
                distance: '3.1 mi',
                reward: '\$15.00 Cash',
                quantity: '20 planks',
                onTap: () => BountiesActions.openBountyDetails(context, 4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
