import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../../main/providers/main_pod.dart';
import '../../../main/providers/main_state.dart';

/// Full-screen celebration view shown upon verified commodity handoff.
class HandoffCelebrationView extends ConsumerWidget {
  final HandoffTransaction transaction;

  const HandoffCelebrationView({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final dollars = (transaction.rewardAmountCents / 100).toStringAsFixed(2);
    final kg = transaction.kgDiverted.toStringAsFixed(1);
    final co2 = transaction.co2eSavedKg.toStringAsFixed(1);

    return Scaffold(
      backgroundColor: pure.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Celebratory Icon
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pure.primary.withValues(alpha: 0.18),
                  border: Border.all(color: pure.primary, width: 3),
                ),
                child: Icon(Icons.check_rounded, size: 52, color: pure.primary),
              ),
              const SizedBox(height: 24),

              Text(
                'Don’t Trash It, Cash It!',
                style: TextStyle(
                  color: pure.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Handoff verified and payment transferred.',
                style: TextStyle(color: pure.textMuted, fontSize: 14),
              ),
              const SizedBox(height: 32),

              // Impact metric card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: pure.surface.blendColor(pure.primary, 0.08),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: pure.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      '+ \$$dollars Credited',
                      style: TextStyle(
                        color: pure.secondary,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(color: pure.borderSubtle.withValues(alpha: 0.3)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatColumn(
                          label: 'Landfill Diverted',
                          value: '$kg kg',
                        ),
                        _StatColumn(label: 'CO2e Avoided', value: '$co2 kg'),
                        _StatColumn(label: 'Trees Equivalent', value: '1.0 🌳'),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // CTA to Impact visualizer
              ScaleClickWrapper(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(MainPod.me.notifier).selectTab(MainTabEntry.home);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: pure.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'View My Earth Impact Dashboard',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;

  const _StatColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: pure.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: pure.textMuted, fontSize: 11),
        ),
      ],
    );
  }
}
