import 'package:flutter/material.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../actions/impact_actions.dart';

/// Grid displaying unlocked circular economy badges and trophies.
class MilestoneTrophyGrid extends StatelessWidget {
  const MilestoneTrophyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    final trophies = const [
      ('🌱', 'Pioneer', 'First upcycle transaction completed', true),
      ('📦', 'Box Master', '10+ cardboard piles diverted', true),
      ('🪵', 'Lumberjack', 'Saved over 25kg of construction wood', true),
      ('🏆', 'Circular Hero', 'Earned over \$50 in waste bounties', false),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Earth Milestones',
          style: TextStyle(
            color: pure.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final t in trophies)
              _TrophyItem(
                emoji: t.$1,
                title: t.$2,
                desc: t.$3,
                isUnlocked: t.$4,
              ),
          ],
        ),
      ],
    );
  }
}

class _TrophyItem extends StatelessWidget {
  final String emoji;
  final String title;
  final String desc;
  final bool isUnlocked;

  const _TrophyItem({
    required this.emoji,
    required this.title,
    required this.desc,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return ScaleClickWrapper(
      onPressed: () => ImpactActions.openTrophyDetails(context, title, desc),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isUnlocked
                  ? pure.surface.blendColor(pure.primary, 0.15)
                  : pure.surfaceHighlight,
              border: Border.all(
                color: isUnlocked
                    ? pure.primary.withValues(alpha: 0.5)
                    : pure.borderSubtle.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              isUnlocked ? emoji : '🔒',
              style: TextStyle(
                fontSize: 24,
                color: isUnlocked ? null : pure.textMuted,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              color: isUnlocked ? pure.textPrimary : pure.textMuted,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
