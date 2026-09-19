import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../shared/components/k_curves.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import 'menu_item_tile.dart';

/// Data class for items displayed in the floating context menu.
class ContextMenuItem {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onTap;

  const ContextMenuItem({
    required this.title,
    this.subtitle,
    required this.icon,
    this.iconColor,
    required this.onTap,
  });
}

/// Frosted glass floating context menu springing up from the trigger button.
class FloatingContextMenu extends StatelessWidget {
  final Rect targetRect;
  final List<ContextMenuItem> items;
  final Animation<double> animation;

  const FloatingContextMenu({
    super.key,
    required this.targetRect,
    required this.items,
    required this.animation,
  });

  static Future<void> show(
    BuildContext context, {
    required Rect targetRect,
    required List<ContextMenuItem> items,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss Menu',
      barrierColor: Colors.black.withValues(alpha: 0.4),
      transitionDuration: Duration.zero,
      pageBuilder: (ctx, anim1, _) => FloatingContextMenu(
        targetRect: targetRect,
        items: items,
        animation: anim1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final size = MediaQuery.of(context).size;
    final bottomOffset = size.height - targetRect.top + 12;
    final rightOffset = (size.width - targetRect.right)
        .clamp(16.0, 48.0)
        .toDouble();

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        Positioned(
          bottom: bottomOffset,
          right: rightOffset,
          child:
              ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        width: 260,
                        decoration: BoxDecoration(
                          color: pure.card.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: pure.borderSubtle.withValues(alpha: 0.4),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 32,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: _MenuListing(items: items),
                      ),
                    ),
                  )
                  .animate()
                  .scaleXY(
                    alignment: Alignment.bottomRight,
                    curve: KCurves.bouncySpring,
                    duration: const Duration(milliseconds: 650),
                  )
                  .fadeIn(duration: const Duration(milliseconds: 250)),
        ),
      ],
    );
  }
}

class _MenuListing extends StatelessWidget {
  final List<ContextMenuItem> items;
  const _MenuListing({required this.items});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            MenuItemTile(
              item: items[i],
              onSelect: () {
                Navigator.of(context).pop();
                items[i].onTap();
              },
            ),
            if (i < items.length - 1)
              Divider(
                height: 1,
                thickness: 0.6,
                color: pure.borderSubtle.withValues(alpha: 0.3),
                indent: 16,
                endIndent: 16,
              ),
          ],
        ],
      ),
    );
  }
}
