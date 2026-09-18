import 'package:flutter/material.dart';

/// Actions for user profile and earnings management.
class ProfileActions {
  const ProfileActions._();

  /// Initiates instant cash withdrawal.
  static void withdrawEarnings(BuildContext context, double amount) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Withdrawal of \$${amount.toStringAsFixed(2)} initiated to connected debit account!',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Opens application settings sheet.
  static void openSettings(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFF161E1A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Ungraey Preferences',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.notifications_active_outlined, color: Color(0xFF10B981)),
              title: const Text('Real-time 5-Mile Bounties Alerts', style: TextStyle(color: Colors.white)),
              trailing: Switch(value: true, onChanged: (_) {}, activeThumbColor: const Color(0xFF10B981)),
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined, color: Color(0xFF10B981)),
              title: const Text('Background Proximity Radius', style: TextStyle(color: Colors.white)),
              subtitle: const Text('Active within 5 miles', style: TextStyle(color: Colors.white60)),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
