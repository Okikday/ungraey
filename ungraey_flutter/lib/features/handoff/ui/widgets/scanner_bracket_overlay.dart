import 'package:flutter/material.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Viewfinder overlay with corner reticles for scanning handoff QR codes.
class ScannerBracketOverlay extends StatelessWidget {
  final VoidCallback onSimulateScan;

  const ScannerBracketOverlay({super.key, required this.onSimulateScan});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              border: Border.all(color: pure.primary, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.qr_code_scanner_rounded,
              size: 48,
              color: pure.primary.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Point camera at seller’s QR code',
            style: TextStyle(color: pure.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: onSimulateScan,
            icon: const Icon(Icons.flash_on_rounded, size: 16),
            label: const Text('Simulate Successful Scan'),
            style: TextButton.styleFrom(
              foregroundColor: pure.primary,
              backgroundColor: pure.primary.withValues(alpha: 0.12),
            ),
          ),
        ],
      ),
    );
  }
}
