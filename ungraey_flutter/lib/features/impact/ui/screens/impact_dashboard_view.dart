import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/gradient_footer.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/impact_pod.dart';
import '../actions/impact_actions.dart';
import '../widgets/community_counter_ticker.dart';
import '../widgets/eco_dial_gauge.dart';
import '../widgets/impact_metric_tile.dart';
import '../widgets/milestone_trophy_grid.dart';

/// Screen displaying animated Earth Forward ecological visualizer.
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
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          children: [
            // Top Action Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earth Forward',
                      style: TextStyle(
                        color: pure.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Verified Landfill Diversion Metrics',
                      style: TextStyle(color: pure.textMuted, fontSize: 13),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => ImpactActions.shareImpact(
                    context,
                    user.totalKgDiverted,
                    user.totalCo2eSavedKg,
                  ),
                  icon: const Icon(Icons.share_outlined),
                  style: IconButton.styleFrom(
                    backgroundColor: pure.surfaceHighlight,
                    foregroundColor: pure.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Animated Eco Dial
            Center(
              child: EcoDialGauge(
                kgDiverted: user.totalKgDiverted,
                co2eAvoided: user.totalCo2eSavedKg,
                treesEquivalent: user.treesSavedEquivalent,
              ),
            ),
            const SizedBox(height: 28),

            // Community Counter Ticker
            CommunityCounterTicker(
              totalKg: comm.totalKgDiverted,
              totalHandoffs: comm.completedHandoffsCount,
            ),
            const SizedBox(height: 20),

            // Concrete Ecological Equivalencies
            ImpactMetricTile(
              title: 'Carbon Footprint Avoided',
              value: '${user.totalCo2eSavedKg.toStringAsFixed(1)} kg CO2e',
              equivalence: 'Equal to avoiding ~205 miles driven by car',
              icon: Icons.cloud_done_rounded,
              color: const Color(0xFF06B6D4),
            ),
            const SizedBox(height: 12),
            ImpactMetricTile(
              title: 'Freshwater Conserved',
              value: '${user.waterSavedLiters.toInt()} Liters',
              equivalence: 'Equivalent to 48 standard home showers',
              icon: Icons.water_drop_rounded,
              color: pure.secondary,
            ),
            const SizedBox(height: 24),

            // Milestone Badges Grid
            const MilestoneTrophyGrid(),

            const SizedBox(height: 12),
            const GradientFooter(label: 'Verified Circular Ledger'),
          ],
        ),
      ),
    );
  }
}
