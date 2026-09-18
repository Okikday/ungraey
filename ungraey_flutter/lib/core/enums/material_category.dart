import 'package:ungraey_client/ungraey_client.dart';
export 'package:ungraey_client/ungraey_client.dart' show MaterialCategory;

/// UI presentation helpers on [MaterialCategory].
extension MaterialCategoryUiExtension on MaterialCategory {
  /// Returns user-facing title.
  String get displayName {
    switch (this) {
      case MaterialCategory.corrugatedCardboard:
        return 'Corrugated Cardboard';
      case MaterialCategory.treatedLumber:
        return 'Treated Lumber';
      case MaterialCategory.hardwoodScrap:
        return 'Hardwood Scrap';
      case MaterialCategory.scrapDenimTextiles:
        return 'Scrap Denim & Textiles';
      case MaterialCategory.cleanGlassJars:
        return 'Clean Glass Jars';
      case MaterialCategory.electronicsScrap:
        return 'Electronics & Circuits';
      case MaterialCategory.metalScrap:
        return 'Metal & Copper Scrap';
      case MaterialCategory.plasticContainers:
        return 'Rigid Plastic Containers';
      case MaterialCategory.other:
        return 'Other Upcyclable';
    }
  }

  /// Returns category emoji.
  String get emoji {
    switch (this) {
      case MaterialCategory.corrugatedCardboard:
        return '📦';
      case MaterialCategory.treatedLumber:
        return '🪵';
      case MaterialCategory.hardwoodScrap:
        return '🪚';
      case MaterialCategory.scrapDenimTextiles:
        return '👖';
      case MaterialCategory.cleanGlassJars:
        return '🫙';
      case MaterialCategory.electronicsScrap:
        return '🔌';
      case MaterialCategory.metalScrap:
        return '🔩';
      case MaterialCategory.plasticContainers:
        return '🧴';
      case MaterialCategory.other:
        return '♻️';
    }
  }

  /// Factor for calculating kg CO2e avoided per kg diverted from landfill.
  double get co2AvoidanceFactorPerKg {
    switch (this) {
      case MaterialCategory.corrugatedCardboard:
        return 1.45;
      case MaterialCategory.treatedLumber:
        return 1.75;
      case MaterialCategory.hardwoodScrap:
        return 2.10;
      case MaterialCategory.scrapDenimTextiles:
        return 3.40;
      case MaterialCategory.cleanGlassJars:
        return 0.70;
      case MaterialCategory.electronicsScrap:
        return 5.20;
      case MaterialCategory.metalScrap:
        return 4.10;
      case MaterialCategory.plasticContainers:
        return 1.90;
      case MaterialCategory.other:
        return 1.00;
    }
  }
}
