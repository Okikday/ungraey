import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/backdrop_shadow.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../../main/providers/main_pod.dart';
import '../../../main/providers/main_state.dart';

/// Top pinned header with user avatar, name, verification status, and action pill.
class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final topInset = MediaQuery.paddingOf(context).top;

    return Stack(
      children: [
        BackdropShadow(
          height: topInset + 68,
          shadowDirection: const (Alignment.topCenter, Alignment.bottomCenter),
          applyBlur: true,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: topInset + 8,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User Avatar
              ScaleClickWrapper(
                onPressed: () {
                  ref.read(MainPod.me.notifier).selectTab(MainTabEntry.profile);
                },
                borderRadius: 100,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: pure.primary.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: pure.primary.withValues(alpha: 0.4),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.user_copy,
                      color: pure.primary,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Title and Role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      'Hi, Upcycler',
                      style: TextStyle(
                        color: pure.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF10B981),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        AppText(
                          'VERIFIED RECYCLER • 5-MILE SYNC',
                          style: TextStyle(
                            color: pure.textMuted,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Search + Notification fused pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: pure.surface,
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                    color: pure.borderSubtle.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.all(6),
                        minimumSize: const Size(32, 32),
                      ),
                      tooltip: 'Search Bounties',
                      onPressed: () {
                        ref
                            .read(MainPod.me.notifier)
                            .selectTab(MainTabEntry.bounties);
                      },
                      icon: Icon(
                        Iconsax.search_normal_copy,
                        size: 18,
                        color: pure.textPrimary,
                      ),
                    ),
                    Container(
                      height: 16,
                      width: 1,
                      color: pure.borderSubtle.withValues(alpha: 0.35),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.all(6),
                        minimumSize: const Size(32, 32),
                      ),
                      tooltip: 'Nearby Alerts',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              '3 buyers actively seeking cardboard & glass jars near you!',
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      icon: Icon(
                        Iconsax.notification_status_copy,
                        size: 18,
                        color: pure.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
