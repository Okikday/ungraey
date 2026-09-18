import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../../bounties/ui/actions/bounties_actions.dart';
import '../../../handoff/ui/actions/handoff_actions.dart';
import '../../providers/main_pod.dart';
import '../../providers/main_state.dart';
import 'floating_context_menu.dart';

/// Floating circular trigger button that presents the frosted quick action context menu.
class SpecialActionButton extends ConsumerStatefulWidget {
  const SpecialActionButton({super.key});

  @override
  ConsumerState<SpecialActionButton> createState() =>
      _SpecialActionButtonState();
}

class _SpecialActionButtonState extends ConsumerState<SpecialActionButton> {
  final GlobalKey _buttonKey = GlobalKey();

  Rect? _getTargetRect() {
    final renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return null;
    final translation = renderBox.localToGlobal(Offset.zero);
    return translation & renderBox.size;
  }

  void _handlePress(MainTabEntry tab) {
    HapticFeedback.lightImpact();
    final targetRect = _getTargetRect();
    if (targetRect == null) return;

    FloatingContextMenu.show(
      context,
      targetRect: targetRect,
      items: [
        ContextMenuItem(
          title: 'Snap Waste Pile',
          subtitle: 'Auto-classify materials & find buyers',
          icon: Iconsax.scan_copy,
          iconColor: const Color(0xFF10B981),
          onTap: () {
            ref.read(MainPod.me.notifier).selectTab(MainTabEntry.snap);
          },
        ),
        ContextMenuItem(
          title: 'Post Material Bounty',
          subtitle: 'Buy or trade for cardboard, jars, lumber',
          icon: Iconsax.box_add_copy,
          iconColor: const Color(0xFFF59E0B),
          onTap: () => BountiesActions.openCreateBounty(context, ref),
        ),
        ContextMenuItem(
          title: 'Scan Handoff QR',
          subtitle: 'Verify commodity transfer & get paid',
          icon: Iconsax.scan_barcode_copy,
          iconColor: const Color(0xFF5375F6),
          onTap: () => HandoffActions.openScanQr(context),
        ),
      ],
    );
  }

  IconData _getIconForTab(MainTabEntry tab) => switch (tab) {
    MainTabEntry.home => Iconsax.add_copy,
    MainTabEntry.bounties => Iconsax.element_plus_copy,
    MainTabEntry.snap => Iconsax.scan_copy,
    MainTabEntry.profile => Iconsax.setting_2_copy,
  };

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final activeTab = ref.watch(MainPod.me.select((s) => s.activeTab));
    final iconData = _getIconForTab(activeTab);

    return SizedBox(
      width: 48,
      height: 48,
      child: FloatingActionButton(
        key: _buttonKey,
        tooltip: 'Quick Commodity Actions',
        backgroundColor: pure.primary,
        foregroundColor: Colors.black,
        elevation: 6,
        shape: const CircleBorder(),
        onPressed: () => _handlePress(activeTab),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          transitionBuilder: (child, anim) {
            return RotationTransition(
              turns: Tween<double>(begin: 0.85, end: 1.0).animate(anim),
              child: FadeTransition(opacity: anim, child: child),
            );
          },
          child: Icon(
            iconData,
            key: ValueKey(iconData),
            size: 22,
          ),
        ),
      ),
    );
  }
}
