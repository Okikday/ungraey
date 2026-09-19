import 'package:flutter/material.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../logic/material_classifier.dart';
import '../../logic/material_price_guide.dart';

/// Renders horizontal scrolling pills for detected material tags.
class DetectedMaterialChips extends StatelessWidget {
  final List<DetectedRegion> regions;

  const DetectedMaterialChips({super.key, required this.regions});

  @override
  Widget build(BuildContext context) {
    if (regions.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          for (final r in regions) ...[
            _MaterialChip(region: r),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _MaterialChip extends StatelessWidget {
  final DetectedRegion region;

  const _MaterialChip({required this.region});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final cat = region.category;
    final estimate = MaterialPriceGuide.estimateFor(cat);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: pure.surface.blendColor(pure.primary, 0.12),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: pure.primary.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(cat.emoji, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            cat.displayName,
            style: TextStyle(
              color: pure.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: pure.primary.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${MaterialPriceGuide.formatDollars(estimate.typicalCents)} • ${(region.confidence * 100).toInt()}%',
              style: TextStyle(
                color: pure.primary,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
