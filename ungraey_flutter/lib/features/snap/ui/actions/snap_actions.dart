import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../bounties/models/bounty_draft.dart';
import '../../../bounties/ui/actions/bounties_actions.dart';
import '../../../bounties/ui/screens/bounty_detail_view.dart';
import '../../../../core/enums/material_category.dart';
import '../../providers/snap_pod.dart';

/// Actions for the AI Snap and material recognition feature.
class SnapActions {
  const SnapActions._();

  /// Captures a photo using device camera or runs simulated high-accuracy scan.
  static Future<void> triggerShutter(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final picker = ImagePicker();
      final photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );
      if (photo != null) {
        await ref
            .read(SnapPod.me.notifier)
            .captureAndMatch(imagePath: photo.path);
        return;
      }
    } catch (_) {
      // Camera not available on simulator or desktop, seamlessly fallback to live simulation
    }
    await ref.read(SnapPod.me.notifier).captureAndMatch();
  }

  /// Picks an existing photo from the device photo gallery.
  static Future<void> pickFromGallery(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (image != null) {
        await ref
            .read(SnapPod.me.notifier)
            .captureAndMatch(imagePath: image.path);
        return;
      }
    } catch (_) {}
    await ref.read(SnapPod.me.notifier).captureAndMatch();
  }

  /// Resets back to live camera viewfinder.
  static void retakeSnap(BuildContext context, WidgetRef ref) {
    ref.read(SnapPod.me.notifier).resetCapture();
  }

  /// Lists the snapped pile for sale, prefilled from AI suggestion + price guide.
  static void listPileForSale(BuildContext context, WidgetRef ref) {
    final state = ref.read(SnapPod.me);
    if (state.detectedRegions.isEmpty) return;
    final top = state.detectedRegions.first;
    BountiesActions.openCreateBounty(
      context,
      ref,
      draft: BountyDraft(
        category: top.category,
        titleHint:
            'Selling: ${top.category.emoji} ${top.category.displayName} lot',
        rewardDollars: (state.estimatedTypicalCents / 100).round().clamp(1, 100).toInt(),
      ),
    );
  }

  /// Opens the matched bounty details in a modal sheet.
  static void openMatchDetails(BuildContext context, int bountyId) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BountyDetailModal(bountyId: bountyId),
    );
  }
}
