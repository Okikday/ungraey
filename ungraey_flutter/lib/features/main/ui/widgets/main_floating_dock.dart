import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/main_pod.dart';

/// Floating navigation dock implementing the Aura squircle pill system.
class MainFloatingDock extends ConsumerWidget {
  const MainFloatingDock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final selectedIndex = ref.watch(MainPod.me.select((s) => s.selectedIndex));

    final items = const [
      (Icons.center_focus_strong_rounded, 'Snap'),
      (Icons.local_mall_rounded, 'Bounties'),
      (Icons.eco_rounded, 'Impact'),
      (Icons.person_rounded, 'Profile'),
    ];

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: pure.surface.blendColor(pure.primary, 0.08),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: pure.borderSubtle.withValues(alpha: 0.28),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < items.length; i++)
            _DockItem(
              icon: items[i].$1,
              label: items[i].$2,
              isSelected: selectedIndex == i,
              onTap: () => ref.read(MainPod.me.notifier).switchTab(i),
            ),
        ],
      ),
    );
  }
}

class _DockItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DockItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return ScaleClickWrapper(
      scaleBetween: const (1.0, 0.92),
      onPressed: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? pure.primary.withValues(alpha: 0.18)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: isSelected
              ? Border.all(color: pure.primary.withValues(alpha: 0.4), width: 1)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? pure.primary : pure.textSecondary,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: pure.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
