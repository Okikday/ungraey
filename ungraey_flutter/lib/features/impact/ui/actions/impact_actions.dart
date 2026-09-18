import 'package:flutter/material.dart';

/// Actions for the Earth Forward impact visualizer.
class ImpactActions {
  const ImpactActions._();

  /// Shows share dialogue / toast with impact metrics.
  static void shareImpact(BuildContext context, double kg, double co2) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Impact copied! You kept ${kg.toStringAsFixed(1)}kg out of landfills, avoiding ${co2.toStringAsFixed(1)}kg CO2e!',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Displays detail modal for milestone trophies.
  static void openTrophyDetails(
    BuildContext context,
    String trophyName,
    String desc,
  ) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(trophyName),
        content: Text(desc),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Awesome'),
          ),
        ],
      ),
    );
  }
}
