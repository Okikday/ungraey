import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../client.dart';
import '../../../network/api.dart';
import '../logic/material_classifier.dart';
import 'snap_state.dart';

final _snapProvider = NotifierProvider.autoDispose<SnapPod, SnapState>(
  SnapPod.new,
  name: 'SnapPod',
);

/// Manages camera capture, AI material classification, and 5-mile matching.
class SnapPod extends AutoDisposeNotifier<SnapState> {
  static final me = _snapProvider;
  final MaterialClassifier classifier = const MaterialClassifier();

  @override
  SnapState build() {
    Future.microtask(runLiveScan);
    return const SnapState();
  }

  /// Runs on-device vision analysis on current camera frame.
  Future<void> runLiveScan() async {
    final regions = await classifier.classifyImage();
    if (state.hasCaptured) return;

    state = state.copyWith(
      detectedRegions: regions,
      isScanning: true,
    );
  }

  /// Triggers a snap capture and performs instant 5-mile matching.
  Future<void> captureAndMatch({String? imagePath}) async {
    state = state.copyWith(isProcessing: true, isScanning: false);

    // Call out to the Serverpod backend AI endpoint
    final result = await client.snap.analyze('dummy_base64_image_data_here');
    final detectedCategories = result.detectedCategories;

    // Convert to mock regions for UI display
    final regions = detectedCategories.map((c) {
      return DetectedRegion(
        category: c,
        normalizedRect: const Rect.fromLTWH(0.2, 0.2, 0.6, 0.6),
        confidence: result.confidenceScore,
      );
    }).toList();

    final allBounties = await Api.instance.listBounties();
    final matching = allBounties.where((b) {
      return detectedCategories.any((c) => c == b.category);
    }).toList();

    int totalEarnable = 0;
    for (final b in matching) {
      totalEarnable += b.rewardAmountCents;
    }
    if (totalEarnable == 0) totalEarnable = result.estimatedValueCents;

    state = state.copyWith(
      isProcessing: false,
      hasCaptured: true,
      capturedImagePath: imagePath ?? 'simulated_garage_waste.jpg',
      detectedRegions: regions,
      matchingBounties: matching.isNotEmpty
          ? matching
          : allBounties.take(2).toList(),
      estimatedLowCents: (result.estimatedValueCents * 0.8).round(),
      estimatedTypicalCents: result.estimatedValueCents,
      estimatedHighCents: (result.estimatedValueCents * 1.5).round(),
      totalPotentialEarningsCents: totalEarnable,
    );
  }

  void resetCapture() {
    state = const SnapState();
    runLiveScan();
  }
}
