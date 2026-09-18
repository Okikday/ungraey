import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../../app/app_provider.dart';
import '../../../../../shared/components/gradient_footer.dart';
import '../../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/profile_pod.dart';
import '../actions/profile_actions.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_settings_group.dart';
import '../widgets/profile_stats_row.dart';
import '../widgets/wallet_card.dart';

/// Screen displaying user account profile, cash wallet, and neighbor reputation.
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final profile = ref.watch(ProfilePod.me);
    final isDark = ref.watch(
      AppPod.me.select((s) => s.themeMode == ThemeMode.dark),
    );

    return Scaffold(
      backgroundColor: pure.scaffoldBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Translucent App Bar
          SliverToBoxAdapter(
            child: ProfileAppBar(
              onRefresh: () => ref.read(ProfilePod.me.notifier).refresh(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // User Header Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProfileHeaderCard(
                name: profile.name,
                email: '${profile.handle} • ${profile.neighborhood}',
                reputationLevel: 'Tier 3 Upcycler • 98% Success',
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Wallet Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: WalletCard(
                balance: profile.walletBalanceDollars,
                points: profile.pointsBalance,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Stats Row
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProfileStatsRow(
                completedHandoffs: profile.completedHandoffs,
                rating: profile.rating,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 22)),

          // Account & Payouts Settings
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProfileSettingsGroup(
                title: 'ACCOUNT & PAYOUTS',
                items: [
                  ProfileSettingsItem(
                    icon: Iconsax.wallet_3_copy,
                    title: 'Withdraw to Bank Account',
                    onTap: () => ProfileActions.withdrawCash(context, ref),
                  ),
                  ProfileSettingsItem(
                    icon: Iconsax.card_pos_copy,
                    title: 'Linked Payout Methods',
                    trailing: Text(
                      'Instant',
                      style: TextStyle(
                        color: pure.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // Preferences
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProfileSettingsGroup(
                title: 'PREFERENCES',
                items: [
                  ProfileSettingsItem(
                    icon: Iconsax.notification_status_copy,
                    title: '5-Mile Proximity Alerts',
                    onTap: () => ProfileActions.openSettings(context),
                  ),
                  ProfileSettingsItem(
                    icon: isDark ? Iconsax.moon_copy : Iconsax.sun_1_copy,
                    title: 'Dark Mode',
                    trailing: Switch(
                      value: isDark,
                      activeThumbColor: pure.primary,
                      onChanged: (_) =>
                          ref.read(AppPod.me.notifier).toggleTheme(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // About & Support
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProfileSettingsGroup(
                title: 'ABOUT & SUPPORT',
                items: [
                  ProfileSettingsItem(
                    icon: Iconsax.info_circle_copy,
                    title: 'About Ungraey',
                    trailing: Text(
                      'v1.0.0 (Earth Forward)',
                      style: TextStyle(color: pure.textMuted, fontSize: 12),
                    ),
                    onTap: () {},
                  ),
                  ProfileSettingsItem(
                    icon: Iconsax.shield_tick_copy,
                    title: 'Smart Settlement Security',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Footer
          const SliverToBoxAdapter(
            child: GradientFooter(label: 'Verified Circular Economy'),
          ),

          // Clearance for Floating Navigation Dock
          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }
}
