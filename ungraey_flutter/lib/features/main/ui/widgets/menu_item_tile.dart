import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import 'floating_context_menu.dart';

/// Tactile row tile for context menu items with circular icon badge.
class MenuItemTile extends StatelessWidget {
  final ContextMenuItem item;
  final VoidCallback onSelect;

  const MenuItemTile({
    super.key,
    required this.item,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final iconColor = item.iconColor ?? pure.primary;

    return ScaleClickWrapper(
      onPressed: () {
        HapticFeedback.selectionClick();
        onSelect();
      },
      borderRadius: 12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.16),
                shape: BoxShape.circle,
              ),
              child: Icon(item.icon, size: 18, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    item.title,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: pure.textPrimary,
                    ),
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 1),
                    AppText(
                      item.subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: pure.textMuted,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
