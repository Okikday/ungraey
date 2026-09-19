import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/gradient_footer.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/impact_pod.dart';
import '../widgets/city_live_pulse_badge.dart';
import '../widgets/community_counter_ticker.dart';
import '../widgets/community_leaderboard_section.dart';
import '../widgets/eco_dial_gauge.dart';
import '../widgets/featured_bounties_section.dart';
import '../widgets/home_header.dart';
import '../widgets/milestone_trophy_grid.dart';
import '../widgets/ongoing_exchanges_section.dart';

/// Earth Forward Home Dashboard blending real-time metrics and commodity marketplace.
class ImpactDashboardView extends ConsumerWidget {
  const ImpactDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final state = ref.watch(ImpactPod.me);
    final user = state.userImpact;
    final comm = state.communityImpact;

    return Scaffold(
      backgroundColor: pure.scaffoldBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Top Floating Header with Avatar & Search Pill
          const SliverToBoxAdapter(child: HomeHeader()),

          // Live City Activity Badge
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CityLivePulseBadge(),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8)),

          // High-Demand Bounties Horizontal Carousel
          const SliverToBoxAdapter(child: FeaturedBountiesSection()),

          const SliverToBoxAdapter(child: SizedBox(height: 22)),

          // Active Exchanges List
          const SliverToBoxAdapter(child: OngoingExchangesSection()),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Animated Eco Dial Visualizer
          SliverToBoxAdapter(
            child: Center(
              child: EcoDialGauge(
                kgDiverted: user.totalKgDiverted,
                co2eAvoided: user.totalCo2eSavedKg,
                treesEquivalent: user.treesSavedEquivalent,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Community Counter Ticker
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CommunityCounterTicker(
                totalKg: comm.totalKgDiverted,
                totalHandoffs: comm.completedHandoffsCount,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 22)),

          // Neighborhood Leaderboard
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CommunityLeaderboardSection(),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 22)),

          // Milestone Trophies Grid
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: MilestoneTrophyGrid(),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 18)),

          // Gradient Footer
          const SliverToBoxAdapter(
            child: GradientFooter(label: 'Verified Circular Economy'),
          ),

          // Clearance for Floating Navigation Dock
          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }
}
