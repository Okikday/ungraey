import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Inset list tile showing an ongoing waste-to-commodity exchange.
class OngoingExchangeTile extends StatelessWidget {
  final String title;
  final String partner;
  final String status;
  final double progress;
  final String emoji;
  final VoidCallback onTap;

  const OngoingExchangeTile({
    super.key,
    required this.title,
    required this.partner,
    required this.status,
    required this.progress,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final percent = (progress * 100).round();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ScaleClickWrapper(
        onPressed: onTap,
        borderRadius: 16,
        child: Container(
          height: 88,
          decoration: BoxDecoration(
            color: pure.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: pure.borderSubtle.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              // Commodity Avatar
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: pure.primary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: pure.primary.withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(emoji, style: const TextStyle(fontSize: 20)),
              ),
              const SizedBox(width: 12),

              // Details & Progress
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppText(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: pure.textPrimary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Icon(
                          Iconsax.arrow_right_3_copy,
                          size: 14,
                          color: pure.textMuted,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    AppText(
                      partner,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: pure.textMuted,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Progress bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 4,
                        color: pure.primary,
                        backgroundColor: pure.surfaceElevated,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Status and percentage
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          status,
                          style: TextStyle(
                            color: pure.textSecondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        AppText(
                          '$percent% ready',
                          style: TextStyle(
                            color: pure.primary,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
