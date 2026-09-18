import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/k_curves.dart';
import '../../../account/profile/ui/screens/profile_view.dart';
import '../../../bounties/ui/screens/bounties_feed_view.dart';
import '../../../impact/ui/screens/impact_dashboard_view.dart';
import '../../../snap/ui/screens/snap_camera_view.dart';
import '../../providers/main_pod.dart';
import '../../providers/main_state.dart';
import '../widgets/main_bottom_nav_bar.dart';
import '../widgets/nearby_alert_pill_overlay.dart';

const _tabs = <MainTabEntry, Widget>{
  MainTabEntry.home: ImpactDashboardView(),
  MainTabEntry.bounties: BountiesFeedView(),
  MainTabEntry.snap: SnapCameraView(),
  MainTabEntry.profile: ProfileView(),
};

/// Root shell widget hosting the PageView and floating dock navigation bar.
class MainShellView extends ConsumerStatefulWidget {
  const MainShellView({super.key});

  @override
  ConsumerState<MainShellView> createState() => _MainShellViewState();
}

class _MainShellViewState extends ConsumerState<MainShellView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(_pageListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final tabIndex = ref.read(MainPod.me.select((s) => s.selectedIndex));
      if (_pageController.hasClients &&
          _pageController.page?.round() != tabIndex) {
        _animateToTab(tabIndex);
      }
    });
  }

  void _pageListener() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_pageController.hasClients) return;
      final isScrolling = _pageController.position.isScrollingNotifier.value;
      final userScrolled =
          _pageController.position.userScrollDirection != ScrollDirection.idle;
      if (isScrolling && !userScrolled) return;

      final isHalfway =
          _pageController.page != null && _pageController.page! % 1 != 0;
      if (isHalfway && isScrolling && !userScrolled) return;

      final page = _pageController.page?.round() ?? 0;
      ref.read(MainPod.me.notifier).setTabIndex(page);
    });
  }

  void _animateToTab(int index) {
    if (!_pageController.hasClients) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 700),
      curve: KCurves.snappySpring,
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeIndex = ref.watch(MainPod.me.select((s) => s.selectedIndex));

    ref.listen(MainPod.me.select((s) => s.selectedIndex), (prev, next) {
      if (_pageController.hasClients && _pageController.page?.round() != next) {
        _animateToTab(next);
      }
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: PopScope(
        canPop: activeIndex == 0,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop && activeIndex != 0) {
            _animateToTab(0);
            ref.read(MainPod.me.notifier).selectTab(MainTabEntry.home);
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                children: _tabs.values.toList(),
              ),
              // ── Live Nearby Alert Pill (Aura §19) ──
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: NearbyAlertPillOverlay(),
              ),
            ],
          ),
          extendBody: true,
          bottomNavigationBar: MainBottomNavBar(
            onTabSelected: (tab) {
              final currIndex = ref.read(
                MainPod.me.select((s) => s.selectedIndex),
              );
              if (tab.index == currIndex) return;
              _animateToTab(tab.index);
              ref.read(MainPod.me.notifier).selectTab(tab);
            },
          ),
        ),
      ),
    );
  }
}
