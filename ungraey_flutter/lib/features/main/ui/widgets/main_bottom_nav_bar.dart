import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/backdrop_shadow.dart';
import '../../../../shared/components/k_curves.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/main_pod.dart';
import '../../providers/main_state.dart';
typedef _TabEntry = (
  MainTabEntry tab,
  IconData activeIcon,
  IconData inactiveIcon,
);

const _tabs = <_TabEntry>[
  (MainTabEntry.home, Iconsax.home_1, Iconsax.home_copy),
  (MainTabEntry.bounties, Iconsax.people, Iconsax.people_copy),
  (MainTabEntry.snap, Iconsax.scan, Iconsax.camera_copy),
  (MainTabEntry.profile, Iconsax.user, Iconsax.user_copy),
];

/// Floating pill dock navigation bar backed by Apple-grade dissolve mask.
class MainBottomNavBar extends ConsumerWidget {
  final void Function(MainTabEntry) onTabSelected;

  const MainBottomNavBar({super.key, required this.onTabSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final activeTab = ref.watch(MainPod.me.select((s) => s.activeTab));
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BackdropShadow(
          height: bottomInset + 88,
          shadowDirection: const (Alignment.bottomCenter, Alignment.topCenter),
          applyBlur: true,
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: bottomInset + 12,
            left: 16,
            right: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  height: 68,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: pure.surface,
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(
                      color: pure.borderSubtle.withValues(alpha: 0.25),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _HighlightIndicator(tabIndex: activeTab.index),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: _tabs
                            .map(
                              (entry) => _NavBarItem(
                                entry: entry,
                                isActive: activeTab == entry.$1,
                                onSelected: () => onTabSelected(entry.$1),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HighlightIndicator extends StatelessWidget {
  final int tabIndex;
  const _HighlightIndicator({required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 600),
      curve: KCurves.bouncySpring,
      left: tabIndex * 66.0,
      child: IgnorePointer(
        child: Container(
          width: 66,
          height: 54,
          decoration: BoxDecoration(
            color: pure.surfaceHighlight,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: pure.borderSubtle,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final _TabEntry entry;
  final bool isActive;
  final VoidCallback onSelected;

  const _NavBarItem({
    required this.entry,
    required this.isActive,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final (tab, activeIcon, inactiveIcon) = entry;

    return SizedBox(
      width: 66,
      child: Tooltip(
        message: tab.normalize(),
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            HapticFeedback.selectionClick();
            onSelected();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                isActive ? activeIcon : inactiveIcon,
                color: isActive ? pure.textPrimary : pure.textMuted,
                size: 22,
              ),
              const SizedBox(height: 3),
              AppText(
                tab.normalize(),
                style: TextStyle(
                  color: isActive ? pure.textPrimary : pure.textMuted,
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
