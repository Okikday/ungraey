import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../../shared/components/app_text.dart';
import '../../../../../shared/components/backdrop_shadow.dart';
import '../../../../../shared/theme/pure_theme_extension.dart';

/// Floating translucent app bar for the Profile screen with backdrop dissolve blur.
class ProfileAppBar extends StatelessWidget {
  final VoidCallback onRefresh;

  const ProfileAppBar({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
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
                'Upcycler Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: pure.textPrimary,
                  letterSpacing: -0.4,
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: pure.surfaceElevated,
                  foregroundColor: pure.primary,
                  minimumSize: const Size(36, 36),
                ),
                tooltip: 'Refresh Profile',
                icon: const Icon(Iconsax.refresh_copy, size: 18),
                onPressed: onRefresh,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
