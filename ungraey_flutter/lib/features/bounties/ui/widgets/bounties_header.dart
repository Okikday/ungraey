import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../shared/components/app_text.dart';
import '../../../../shared/components/backdrop_shadow.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../actions/bounties_actions.dart';

/// Top pinned header displaying "Commodity Bounties" title and proximity button.
class BountiesHeader extends ConsumerWidget {
  const BountiesHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final topInset = MediaQuery.paddingOf(context).top;

    return Stack(
      children: [
        BackdropShadow(
          height: topInset + 56,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Bounties',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: pure.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: pure.surfaceElevated,
                  foregroundColor: pure.primary,
                  minimumSize: const Size(38, 38),
                ),
                tooltip: 'Proximity Radius',
                icon: const Icon(Iconsax.radar_2_copy, size: 18),
                onPressed: () => BountiesActions.openRadiusFilter(context, ref),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
