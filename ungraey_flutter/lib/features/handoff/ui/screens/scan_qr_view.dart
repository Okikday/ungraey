import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/handoff_pod.dart';
import '../actions/handoff_actions.dart';
import '../widgets/scanner_bracket_overlay.dart';

/// Modal sheet for buyers to scan seller's QR code.
class ScanQrModal extends ConsumerWidget {
  const ScanQrModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final state = ref.watch(HandoffPod.me);

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: pure.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: pure.borderSubtle.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Scan Handoff QR',
            style: TextStyle(
              color: pure.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          if (state.isVerifying)
            CircularProgressIndicator(color: pure.primary)
          else
            ScannerBracketOverlay(
              onSimulateScan: () async {
                final tx = await ref
                    .read(HandoffPod.me.notifier)
                    .verify('UNGRAEY-SIMULATED-TOKEN');
                if (context.mounted && tx != null) {
                  Navigator.pop(context);
                  HandoffActions.openCelebration(context, tx);
                }
              },
            ),
          const Spacer(),
        ],
      ),
    );
  }
}
