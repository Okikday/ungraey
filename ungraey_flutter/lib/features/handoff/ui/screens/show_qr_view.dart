import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/handoff_pod.dart';
import '../actions/handoff_actions.dart';
import '../widgets/qr_pulsing_card.dart';

/// Modal view displaying seller's single-use cryptographic handoff QR code.
class ShowQrModal extends ConsumerStatefulWidget {
  final int bountyId;
  const ShowQrModal({super.key, required this.bountyId});

  @override
  ConsumerState<ShowQrModal> createState() => _ShowQrModalState();
}

class _ShowQrModalState extends ConsumerState<ShowQrModal> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(HandoffPod.me.notifier).initiate(widget.bountyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final state = ref.watch(HandoffPod.me);
    final tx = state.activeTransaction;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: pure.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            'Handoff Verification',
            style: TextStyle(
              color: pure.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Show this QR code to the buyer to release your bounty reward.',
            textAlign: TextAlign.center,
            style: TextStyle(color: pure.textMuted, fontSize: 13),
          ),
          const SizedBox(height: 24),

          if (state.isGenerating || tx == null)
            Padding(
              padding: const EdgeInsets.all(48),
              child: CircularProgressIndicator(color: pure.primary),
            )
          else
            QrPulsingCard(
              qrData: tx.qrToken,
              secondsRemaining: state.secondsRemaining,
            ),

          const SizedBox(height: 24),

          // Simulate buyer scan shortcut for hackathon testing
          ScaleClickWrapper(
            onPressed: () {
              Navigator.pop(context);
              if (tx != null) {
                HandoffActions.openCelebration(context, tx);
              }
            },
            child: Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                color: pure.surfaceHighlight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: pure.primary.withValues(alpha: 0.3)),
              ),
              alignment: Alignment.center,
              child: Text(
                'Simulate Buyer Scan & Verify',
                style: TextStyle(
                  color: pure.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
