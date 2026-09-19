import 'package:equatable/equatable.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../logic/material_classifier.dart';

/// State of the AI camera snap and material recognition flow.
class SnapState extends Equatable {
  final bool isScanning;
  final bool isProcessing;
  final String? capturedImagePath;
  final List<DetectedRegion> detectedRegions;
  final List<Bounty> matchingBounties;
  final bool hasCaptured;
  final double estimatedTotalKg;
  final int totalPotentialEarningsCents;

  const SnapState({
    this.isScanning = true,
    this.isProcessing = false,
    this.capturedImagePath,
    this.detectedRegions = const [],
    this.matchingBounties = const [],
    this.hasCaptured = false,
    this.estimatedTotalKg = 0.0,
    this.totalPotentialEarningsCents = 0,
  });

  SnapState copyWith({
    bool? isScanning,
    bool? isProcessing,
    String? capturedImagePath,
    List<DetectedRegion>? detectedRegions,
    List<Bounty>? matchingBounties,
    bool? hasCaptured,
    double? estimatedTotalKg,
    int? totalPotentialEarningsCents,
  }) {
    return SnapState(
      isScanning: isScanning ?? this.isScanning,
      isProcessing: isProcessing ?? this.isProcessing,
      capturedImagePath: capturedImagePath ?? this.capturedImagePath,
      detectedRegions: detectedRegions ?? this.detectedRegions,
      matchingBounties: matchingBounties ?? this.matchingBounties,
      hasCaptured: hasCaptured ?? this.hasCaptured,
      estimatedTotalKg: estimatedTotalKg ?? this.estimatedTotalKg,
      totalPotentialEarningsCents:
          totalPotentialEarningsCents ?? this.totalPotentialEarningsCents,
    );
  }

  @override
  List<Object?> get props => [
    isScanning,
    isProcessing,
    capturedImagePath,
    detectedRegions,
    matchingBounties,
    hasCaptured,
    estimatedTotalKg,
    totalPotentialEarningsCents,
  ];
}
