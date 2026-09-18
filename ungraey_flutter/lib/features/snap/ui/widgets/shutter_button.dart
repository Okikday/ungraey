import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Shutter button with dual concentric circles and tactile haptic response.
class ShutterButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isProcessing;

  const ShutterButton({
    super.key,
    required this.onTap,
    this.isProcessing = false,
  });

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return ScaleClickWrapper(
      scaleBetween: const (1.0, 0.88),
      onPressed: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: pure.primary.withValues(alpha: 0.8),
            width: 3.5,
          ),
          boxShadow: [
            BoxShadow(
              color: pure.primary.withValues(alpha: 0.35),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: isProcessing
            ? SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: pure.primary,
                ),
              )
            : Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pure.primary,
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.black,
                  size: 28,
                ),
              ),
      ),
    );
  }
}
