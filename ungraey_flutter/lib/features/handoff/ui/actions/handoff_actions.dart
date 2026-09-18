import 'package:flutter/material.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../screens/handoff_celebration_view.dart';
import '../screens/scan_qr_view.dart';
import '../screens/show_qr_view.dart';

/// Actions for the QR handoff and value exchange flow.
class HandoffActions {
  const HandoffActions._();

  /// Opens the Show QR code modal for the seller.
  static void openShowQr(BuildContext context, int bountyId) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ShowQrModal(bountyId: bountyId),
    );
  }

  /// Opens the QR scanner modal for the buyer.
  static void openScanQr(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ScanQrModal(),
    );
  }

  /// Shows the Earth Forward celebration screen upon verified completion.
  static void openCelebration(BuildContext context, HandoffTransaction tx) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => HandoffCelebrationView(transaction: tx),
      ),
    );
  }
}
