import 'package:flutter/material.dart';
import '../theme/pure_theme_extension.dart';
import 'app_text.dart';
import 'scale_click_wrapper.dart';

/// Section header displaying title and optional interactive action label.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            title,
            style: TextStyle(
              color: pure.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          if (actionLabel != null)
            ScaleClickWrapper(
              onPressed: onActionTap,
              borderRadius: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: AppText(
                  actionLabel!,
                  style: TextStyle(
                    color: pure.primary,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
