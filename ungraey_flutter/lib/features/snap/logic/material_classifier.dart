import 'dart:math';
import 'package:flutter/material.dart';
import '../../../core/enums/material_category.dart';

/// Detection bounding box with category and confidence for viewfinder overlay.
class DetectedRegion {
  final Rect normalizedRect;
  final MaterialCategory category;
  final double confidence;

  const DetectedRegion({
    required this.normalizedRect,
    required this.category,
    required this.confidence,
  });
}

/// Vision classifier analyzing captured photos or real-time camera frames.
class MaterialClassifier {
  const MaterialClassifier();

  /// Simulates / runs on-device vision classification on an image.
  Future<List<DetectedRegion>> classifyImage({String? imagePath}) async {
    // Realistic on-device inference latency
    await Future.delayed(const Duration(milliseconds: 650));

    final random = Random();
    // Default high-probability categories for garage / maker waste.
    // Vision only identifies material + confidence — never weight.
    final samplePool = [
      (
        MaterialCategory.corrugatedCardboard,
        const Rect.fromLTWH(0.12, 0.18, 0.72, 0.38),
        0.94 + random.nextDouble() * 0.05,
      ),
      (
        MaterialCategory.treatedLumber,
        const Rect.fromLTWH(0.20, 0.58, 0.65, 0.28),
        0.88 + random.nextDouble() * 0.07,
      ),
      (
        MaterialCategory.cleanGlassJars,
        const Rect.fromLTWH(0.08, 0.30, 0.45, 0.35),
        0.91 + random.nextDouble() * 0.06,
      ),
      (
        MaterialCategory.scrapDenimTextiles,
        const Rect.fromLTWH(0.48, 0.25, 0.44, 0.42),
        0.87 + random.nextDouble() * 0.08,
      ),
    ];

    // Select 1 to 2 regions for realistic multi-material garage pile detection
    final count = 1 + random.nextInt(2);
    final results = <DetectedRegion>[];

    for (int i = 0; i < count && i < samplePool.length; i++) {
      final sample = samplePool[i];
      results.add(
        DetectedRegion(
          normalizedRect: sample.$2,
          category: sample.$1,
          confidence: (sample.$3).clamp(0.0, 1.0).toDouble(),
        ),
      );
    }

    return results;
  }
}
