import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/snap_pod.dart';
import '../actions/snap_actions.dart';
import '../widgets/camera_viewfinder_hud.dart';
import '../widgets/detected_material_chips.dart';
import '../widgets/instant_match_card.dart';
import '../widgets/shutter_button.dart';

/// Camera view with live AI material detection and instant 5-mile matching.
class SnapCameraView extends ConsumerWidget {
  const SnapCameraView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final state = ref.watch(SnapPod.me);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background simulation canvas / camera viewport
          Positioned.fill(
            child: Container(
              color: const Color(0xFF131815),
              child: state.hasCaptured
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.all(24),
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: pure.surface,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: pure.primary.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.detectedRegions.isNotEmpty
                                  ? state.detectedRegions.first.category.emoji
                                  : '📦',
                              style: const TextStyle(fontSize: 64),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Waste Pile Analyzed',
                              style: TextStyle(
                                color: pure.textPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Estimated weight: ${state.estimatedTotalKg} kg',
                              style: TextStyle(color: pure.textMuted, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const CameraViewfinderHud(),
            ),
          ),

          // Top App Header
          Positioned(
            top: 54,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: pure.primary.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pure.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'AI Vision Active',
                        style: TextStyle(
                          color: pure.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => SnapActions.pickFromGallery(context, ref),
                  icon: const Icon(Icons.photo_library_outlined, color: Colors.white),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Controls & Matching Overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 84, // elevated above floating dock
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.hasCaptured)
                  const InstantMatchCard()
                else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DetectedMaterialChips(regions: state.detectedRegions),
                  ),
                  const SizedBox(height: 20),
                  ShutterButton(
                    isProcessing: state.isProcessing,
                    onTap: () => SnapActions.triggerShutter(context, ref),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
