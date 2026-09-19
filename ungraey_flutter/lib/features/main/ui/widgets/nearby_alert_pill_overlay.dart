import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/k_curves.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/nearby_alert_pod.dart';
import '../../providers/nearby_alert_state.dart';

/// Frosted alert pill that slides in from the top carrying real-time nearby events.
/// Conforms to Aura Design System §19 — Floating Dynamic Nearby Alert Pill.
class NearbyAlertPillOverlay extends ConsumerWidget {
  const NearbyAlertPillOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(NearbyAlertPod.me);
    final alert = state.alert;

    return AnimatedSlide(
      offset: state.visible ? Offset.zero : const Offset(0, -1.6),
      duration: const Duration(milliseconds: 300),
      curve: state.visible ? KCurves.bouncySpring : Curves.easeInQuart,
      child: alert == null
          ? const SizedBox.shrink()
          : _AlertPill(
              alert: alert,
              onDismiss: () => ref.read(NearbyAlertPod.me.notifier).dismiss(),
            ),
    );
  }
}

class _AlertPill extends StatelessWidget {
  final NearbyAlert alert;
  final VoidCallback onDismiss;

  const _AlertPill({required this.alert, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    final topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: topPadding + 6, left: 16, right: 16),
      child: GestureDetector(
        onTap: onDismiss,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: pure.navBarBackground,
                borderRadius: BorderRadius.circular(1000),
                border: Border.all(
                  color: pure.border,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 24,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _PulsingDot(isSnap: alert.isSnap, pure: pure),
                  const SizedBox(width: 8),
                  Text(
                    alert.emoji,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          alert.headline,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: pure.textPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          alert.detail,
                          style: TextStyle(
                            color: pure.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ).animate().fadeIn(duration: 220.ms, curve: Curves.easeOut),
    );
  }
}

/// Pulsing indicator dot — green for bounty, amber for snap match.
class _PulsingDot extends StatelessWidget {
  final bool isSnap;
  final PureThemeExtension pure;

  const _PulsingDot({required this.isSnap, required this.pure});

  @override
  Widget build(BuildContext context) {
    final color = isSnap ? pure.secondary : pure.primary;
    return SizedBox(
      width: 10,
      height: 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (c) => c.repeat())
              .scaleXY(end: 1.8, duration: 900.ms, curve: Curves.easeOut)
              .fadeOut(duration: 900.ms),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
