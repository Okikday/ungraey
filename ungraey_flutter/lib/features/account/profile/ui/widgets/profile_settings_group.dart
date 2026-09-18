import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../shared/components/app_text.dart';
import '../../../../../shared/components/scale_click_wrapper.dart';
import '../../../../../shared/theme/pure_theme_extension.dart';

/// Model representing an individual settings row inside an inset group.
class ProfileSettingsItem {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDestructive;

  const ProfileSettingsItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    this.isDestructive = false,
  });
}

/// Inset grouped iOS-style section with rounded square icons and hairline dividers.
class ProfileSettingsGroup extends StatelessWidget {
  final String title;
  final List<ProfileSettingsItem> items;

  const ProfileSettingsGroup({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, bottom: 8),
          child: AppText(
            title,
            style: TextStyle(
              color: pure.textMuted,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: pure.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: pure.borderSubtle.withValues(alpha: 0.25),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, _) => Divider(
                color: pure.borderSubtle.withValues(alpha: 0.2),
                height: 1,
                indent: 60,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                final textColor = item.isDestructive
                    ? pure.error
                    : pure.textPrimary;

                final rowWidget = Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: item.isDestructive
                              ? pure.error.withValues(alpha: 0.12)
                              : pure.surfaceElevated,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Center(
                          child: Icon(
                            item.icon,
                            color: item.isDestructive
                                ? pure.error
                                : pure.primary,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppText(
                          item.title,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (item.trailing != null)
                        item.trailing!
                      else
                        Icon(
                          Icons.chevron_right_rounded,
                          color: pure.textMuted,
                          size: 20,
                        ),
                    ],
                  ),
                );

                if (item.onTap != null) {
                  return ScaleClickWrapper(
                    scaleBetween: const (1.0, 0.985),
                    borderRadius: 16,
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      item.onTap?.call();
                    },
                    child: rowWidget,
                  );
                }

                return rowWidget;
              },
            ),
          ),
        ),
      ],
    );
  }
}
