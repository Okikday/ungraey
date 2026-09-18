import 'package:flutter/material.dart';

/// Tactile scale-down feedback on press.
/// Decouples gesture state changes from child widgets using ValueNotifier.
class ScaleClickWrapper extends StatefulWidget {
  final (double, double) scaleBetween;
  final double borderRadius;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;

  const ScaleClickWrapper({
    super.key,
    this.scaleBetween = const (1.0, 0.96),
    this.borderRadius = 16.0,
    this.onPressed,
    this.onLongPress,
    required this.child,
  });

  @override
  State<ScaleClickWrapper> createState() => _ScaleClickWrapperState();
}

class _ScaleClickWrapperState extends State<ScaleClickWrapper> {
  final ValueNotifier<bool> _isPressed = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isPressed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isPressed,
      builder: (context, pressed, child) {
        return AnimatedScale(
          scale: pressed ? widget.scaleBetween.$2 : widget.scaleBetween.$1,
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOutCubic,
          child: child,
        );
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _isPressed.value = true,
        onTapUp: (_) => _isPressed.value = false,
        onTapCancel: () => _isPressed.value = false,
        onTap: widget.onPressed,
        onLongPress: widget.onLongPress,
        child: widget.child,
      ),
    );
  }
}
