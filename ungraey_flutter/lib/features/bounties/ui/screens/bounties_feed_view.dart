import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/gradient_footer.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/bounties_pod.dart';
import '../actions/bounties_actions.dart';
import '../widgets/bounties_header.dart';
import '../widgets/bounty_search_bar.dart';
import '../widgets/bounty_tile.dart';
import '../widgets/category_filter_pills.dart';
import '../widgets/pinned_bounties_section.dart';

/// Screen presenting the commodity bounties marketplace with slivers layout.
class BountiesFeedView extends ConsumerWidget {
  const BountiesFeedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final state = ref.watch(BountiesPod.me);
    final bounties = state.filteredBounties;

    return Scaffold(
      backgroundColor: pure.scaffoldBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Pinned Header with Proximity Action ──
          const SliverToBoxAdapter(child: BountiesHeader()),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),

          // ── High Urgency Pinned Bounties Carousel ──
          const SliverToBoxAdapter(child: PinnedBountiesSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 14)),

          // ── Inset Search Bar ──
          const SliverToBoxAdapter(child: BountySearchBar()),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),

          // ── Category Filter Pills ──
          SliverToBoxAdapter(
            child: CategoryFilterPills(
              selectedCategory: state.selectedCategory,
              onSelect: (cat) =>
                  ref.read(BountiesPod.me.notifier).selectCategory(cat),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // ── Feed List ──
          if (state.isLoading)
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: CircularProgressIndicator(color: pure.primary),
                ),
              ),
            )
          else if (bounties.isEmpty)
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: AppText(
                    'No active bounties in this category yet.\nTap the + action to publish one!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: pure.textMuted, fontSize: 13),
                  ),
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final bounty = bounties[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: BountyTile(
                      bounty: bounty,
                      onTap: () => BountiesActions.openBountyDetails(
                        context,
                        bounty.id ?? 1,
                      ),
                    ),
                  );
                },
                childCount: bounties.length,
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // ── Footer ──
          const SliverToBoxAdapter(
            child: GradientFooter(
              label: 'All Active Bounties in 5-Mile Radius',
            ),
          ),

          // Clearance for Floating Navigation Dock
          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }
}
