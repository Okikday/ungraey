import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../shared/theme/pure_theme_extension.dart';

/// Live pulsing badge showing rolling city-wide exchange activity.
/// Simulates a real-time WebSocket feed of community diversion events.
class CityLivePulseBadge extends StatefulWidget {
  const CityLivePulseBadge({super.key});

  @override
  State<CityLivePulseBadge> createState() => _CityLivePulseBadgeState();
}

class _CityLivePulseBadgeState extends State<CityLivePulseBadge> {
  static const _events = [
    '🫙 Glass jars picked up • 0.4 mi',
    '📦 12 kg cardboard exchanged • 1.1 mi',
    '🪵 Lumber handed off • 2.4 mi',
    '👕 3 kg denim collected • 0.8 mi',
    '🔌 E-waste drop-off • 3.0 mi',
    '📰 Paper bundle traded • 1.6 mi',
  ];

  int _index = 0;
  Timer? _timer;
  Timer? _fadeTimer;
  bool _animIn = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      setState(() {
        _animIn = false;
      });
      _fadeTimer?.cancel();
      _fadeTimer = Timer(const Duration(milliseconds: 300), () {
        if (!mounted) return;
        setState(() {
          _index = (_index + 1) % _events.length;
          _animIn = true;
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _fadeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return AnimatedOpacity(
      opacity: _animIn ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 280),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: pure.surface.blendColor(pure.primary, 0.07),
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(
            color: pure.primary.withValues(alpha: 0.22),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _RedDot(pure: pure),
            const SizedBox(width: 6),
            Text(
              _events[_index],
              style: TextStyle(
                color: pure.textSecondary,
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Looping pulsing red-green indicator dot.
class _RedDot extends StatelessWidget {
  final PureThemeExtension pure;

  const _RedDot({required this.pure});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8,
      height: 8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: pure.primary.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (c) => c.repeat())
              .scaleXY(end: 2.0, duration: 1000.ms, curve: Curves.easeOut)
              .fadeOut(duration: 1000.ms),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: pure.primary,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
