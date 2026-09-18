import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/backdrop_shadow.dart';
import '../../../account/profile/ui/screens/profile_view.dart';
import '../../../bounties/ui/screens/bounties_feed_view.dart';
import '../../../impact/ui/screens/impact_dashboard_view.dart';
import '../../../snap/ui/screens/snap_camera_view.dart';
import '../../providers/main_pod.dart';
import '../widgets/main_floating_dock.dart';

/// Root navigation shell hosting the 4 core feature tabs and floating dock.
class MainShellView extends ConsumerWidget {
  const MainShellView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(MainPod.me.select((s) => s.selectedIndex));

    final screens = const [
      SnapCameraView(),
      BountiesFeedView(),
      ImpactDashboardView(),
      ProfileView(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Active Tab Screen
          Positioned.fill(
            child: IndexedStack(
              index: selectedIndex,
              children: screens,
            ),
          ),

          // Apple-Grade Dissolve Shadow Mask above the Floating Dock
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BackdropShadow(
              height: 110,
              applyBlur: true,
            ),
          ),

          // Aura Floating Navigation Dock
          const Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: Center(child: MainFloatingDock()),
          ),
        ],
      ),
    );
  }
}
