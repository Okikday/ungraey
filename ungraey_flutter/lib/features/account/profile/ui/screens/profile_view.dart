import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/components/gradient_footer.dart';
import '../../../../../shared/theme/pure_theme_extension.dart';
import '../../../../../app/app_provider.dart';
import '../../providers/profile_pod.dart';
import '../actions/profile_actions.dart';
import '../widgets/profile_stats_row.dart';
import '../widgets/wallet_card.dart';

/// Screen displaying user account profile, cash wallet, and neighbor reputation.
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final profile = ref.watch(ProfilePod.me);
    final isDark = ref.watch(AppPod.me.select((s) => s.themeMode == ThemeMode.dark));

    return Scaffold(
      backgroundColor: pure.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          children: [
            // Top Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Account',
                  style: TextStyle(
                    color: pure.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => ref.read(AppPod.me.notifier).toggleTheme(),
                      icon: Icon(isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
                      style: IconButton.styleFrom(
                        backgroundColor: pure.surfaceHighlight,
                        foregroundColor: pure.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => ProfileActions.openSettings(context),
                      icon: const Icon(Icons.settings_outlined),
                      style: IconButton.styleFrom(
                        backgroundColor: pure.surfaceHighlight,
                        foregroundColor: pure.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Profile Header Tile
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: pure.primary.withValues(alpha: 0.15),
                    border: Border.all(color: pure.primary, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'AR',
                    style: TextStyle(
                      color: pure.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name,
                        style: TextStyle(
                          color: pure.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${profile.handle} • ${profile.neighborhood}',
                        style: TextStyle(color: pure.textMuted, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Wallet Card
            WalletCard(
              balance: profile.walletBalanceDollars,
              points: profile.pointsBalance,
            ),
            const SizedBox(height: 18),

            // Stats Row
            ProfileStatsRow(
              completedHandoffs: profile.completedHandoffs,
              rating: profile.rating,
            ),
            const SizedBox(height: 24),

            // Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: pure.surfaceHighlight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.shield_outlined, color: pure.primary, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Ungraey Smart Settlement guarantees 100% verified payouts for every upcycled waste exchange.',
                      style: TextStyle(
                        color: pure.textSecondary,
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const GradientFooter(label: 'Circular Account Verified'),
          ],
        ),
      ),
    );
  }
}
