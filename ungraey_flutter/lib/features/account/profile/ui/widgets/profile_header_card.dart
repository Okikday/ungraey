import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../../shared/components/app_text.dart';
import '../../../../../shared/theme/pure_theme_extension.dart';

/// Top profile card with user avatar, reputation badge, and verified credentials.
class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final String email;
  final String reputationLevel;

  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.email,
    required this.reputationLevel,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: pure.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: pure.borderSubtle.withValues(alpha: 0.25),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Glowing Avatar
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: pure.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(
                color: pure.primary.withValues(alpha: 0.4),
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Icon(
              Iconsax.user_copy,
              color: pure.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),

          // User Info & Tier
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: AppText(
                        name,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: pure.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.verified_rounded,
                      color: pure.primary,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                AppText(
                  email,
                  style: TextStyle(
                    fontSize: 12,
                    color: pure.textMuted,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2.5,
                  ),
                  decoration: BoxDecoration(
                    color: pure.primary.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: AppText(
                    reputationLevel,
                    style: TextStyle(
                      color: pure.primary,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
