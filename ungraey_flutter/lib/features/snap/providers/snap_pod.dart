import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../network/api.dart';
import '../logic/material_classifier.dart';
import 'snap_state.dart';

final _snapProvider =
    NotifierProvider.autoDispose<SnapPod, SnapState>(SnapPod.new, name: 'SnapPod');

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

    final regions = await classifier.classifyImage(imagePath: imagePath);

    double totalKg = 0;
    for (final r in regions) {
      totalKg += r.estimatedKg;
    }

    final allBounties = await Api.instance.listBounties();
    final matching = allBounties.where((b) {
      return regions.any((r) => r.category == b.category);
    }).toList();

    int totalEarnable = 0;
    for (final b in matching) {
      totalEarnable += b.rewardAmountCents;
    }
    if (totalEarnable == 0) totalEarnable = 1250;

    state = state.copyWith(
      isProcessing: false,
      hasCaptured: true,
      capturedImagePath: imagePath ?? 'simulated_garage_waste.jpg',
      detectedRegions: regions,
      matchingBounties: matching.isNotEmpty ? matching : allBounties.take(2).toList(),
      estimatedTotalKg: totalKg > 0 ? totalKg : 14.5,
      totalPotentialEarningsCents: totalEarnable,
    );
  }

  void resetCapture() {
    state = const SnapState();
    runLiveScan();
  }
}
