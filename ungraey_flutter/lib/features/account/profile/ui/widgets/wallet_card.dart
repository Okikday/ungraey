import 'package:flutter/material.dart';
import '../../../../../shared/components/scale_click_wrapper.dart';
import '../../../../../shared/theme/pure_theme_extension.dart';
import '../actions/profile_actions.dart';

/// Card tile highlighting cash balance and instant payout triggers.
class WalletCard extends StatelessWidget {
  final double balance;
  final int points;

  const WalletCard({
    super.key,
    required this.balance,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: pure.surface.blendColor(pure.primary, 0.08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: pure.primary.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'UPCYCLE EARNINGS',
                style: TextStyle(
                  color: pure.textMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: pure.secondary.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '$points ECO PTS',
                  style: TextStyle(
                    color: pure.secondary,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '\$${balance.toStringAsFixed(2)}',
            style: TextStyle(
              color: pure.textPrimary,
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          ScaleClickWrapper(
            onPressed: () => ProfileActions.withdrawEarnings(context, balance),
            child: Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                color: pure.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Instant Cash Out to Bank',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
