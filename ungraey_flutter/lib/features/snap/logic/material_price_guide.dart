import '../../../core/enums/material_category.dart';

/// Single market value estimate for one material category.
///
/// Values describe a standard household lot (not a camera-weighed pile),
/// grounded in typical US local-reuse / scrap averages. Final price is
/// always agreed by buyer and seller at handoff.
class MaterialPriceEstimate {
  final MaterialCategory category;
  final int lowCents;
  final int typicalCents;
  final int highCents;
  final String basis;

  const MaterialPriceEstimate({
    required this.category,
    required this.lowCents,
    required this.typicalCents,
    required this.highCents,
    required this.basis,
  });
}

/// Hypothetical local market price guide for shareable materials.
///
/// Anything clean and reusable — recyclable or not, excluding rotten or
/// food waste — can be listed. Estimates help sellers see roughly what a
/// lot could earn instead of just recycling it.
class MaterialPriceGuide {
  const MaterialPriceGuide._();

  /// Returns the market estimate for a single [category].
  static MaterialPriceEstimate estimateFor(MaterialCategory category) {
    switch (category) {
      case MaterialCategory.corrugatedCardboard:
        return const MaterialPriceEstimate(
          category: MaterialCategory.corrugatedCardboard,
          lowCents: 300,
          typicalCents: 500,
          highCents: 800,
          basis: '25–40 clean flattened boxes',
        );
      case MaterialCategory.treatedLumber:
        return const MaterialPriceEstimate(
          category: MaterialCategory.treatedLumber,
          lowCents: 800,
          typicalCents: 1500,
          highCents: 2500,
          basis: 'Small bundle of offcuts',
        );
      case MaterialCategory.hardwoodScrap:
        return const MaterialPriceEstimate(
          category: MaterialCategory.hardwoodScrap,
          lowCents: 1200,
          typicalCents: 1800,
          highCents: 3000,
          basis: 'Oak / walnut / pine cuts',
        );
      case MaterialCategory.scrapDenimTextiles:
        return const MaterialPriceEstimate(
          category: MaterialCategory.scrapDenimTextiles,
          lowCents: 400,
          typicalCents: 600,
          highCents: 1000,
          basis: '8–12 clean garments',
        );
      case MaterialCategory.cleanGlassJars:
        return const MaterialPriceEstimate(
          category: MaterialCategory.cleanGlassJars,
          lowCents: 300,
          typicalCents: 500,
          highCents: 800,
          basis: '20–40 wide-mouth jars',
        );
      case MaterialCategory.electronicsScrap:
        return const MaterialPriceEstimate(
          category: MaterialCategory.electronicsScrap,
          lowCents: 1500,
          typicalCents: 2500,
          highCents: 4000,
          basis: 'Cables, boards, small devices',
        );
      case MaterialCategory.metalScrap:
        return const MaterialPriceEstimate(
          category: MaterialCategory.metalScrap,
          lowCents: 1000,
          typicalCents: 1800,
          highCents: 3000,
          basis: 'Mixed steel / alu / copper lot',
        );
      case MaterialCategory.plasticContainers:
        return const MaterialPriceEstimate(
          category: MaterialCategory.plasticContainers,
          lowCents: 200,
          typicalCents: 300,
          highCents: 600,
          basis: 'Rigid bins and totes',
        );
      case MaterialCategory.other:
        return const MaterialPriceEstimate(
          category: MaterialCategory.other,
          lowCents: 200,
          typicalCents: 400,
          highCents: 800,
          basis: 'General clean upcyclable lot',
        );
    }
  }

  /// Sums low / typical / high estimates across detected [categories].
  static ({int lowCents, int typicalCents, int highCents}) sumFor(
    Iterable<MaterialCategory> categories,
  ) {
    var low = 0;
    var typical = 0;
    var high = 0;
    for (final category in categories) {
      final estimate = estimateFor(category);
      low += estimate.lowCents;
      typical += estimate.typicalCents;
      high += estimate.highCents;
    }
    return (lowCents: low, typicalCents: typical, highCents: high);
  }

  /// Formats [cents] as a whole-dollar market figure (e.g. 1500 -> $15).
  static String formatDollars(int cents) => '\$${(cents / 100).round()}';
}
