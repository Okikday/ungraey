import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'nearby_alert_state.dart';

final _nearbyAlertProvider =
    NotifierProvider.autoDispose<NearbyAlertPod, NearbyAlertState>(
      NearbyAlertPod.new,
      name: 'NearbyAlertPod',
    );

/// Simulates a real-time WebSocket feed of nearby bounty + snap events
/// and surfaces the most recent one as an auto-dismissing pill notification.
class NearbyAlertPod extends AutoDisposeNotifier<NearbyAlertState> {
  static final me = _nearbyAlertProvider;

  Timer? _timer;
  int _alertIndex = 0;

  static const _alerts = [
    NearbyAlert(
      emoji: '🫙',
      headline: 'Ceramics Studio wants 50 Glass Jars',
      detail: '\$5.00 • 0.8 mi away',
      isSnap: false,
    ),
    NearbyAlert(
      emoji: '📦',
      headline: 'Moving Co. needs infinite cardboard boxes',
      detail: '\$0.05/box • 1.4 mi away',
      isSnap: false,
    ),
    NearbyAlert(
      emoji: '👕',
      headline: 'New Snap matched your Denim Bounty',
      detail: '4.2 kg • 2.1 mi away',
      isSnap: true,
    ),
    NearbyAlert(
      emoji: '🪵',
      headline: 'Maker Lab wants scrap lumber',
      detail: 'Trade or \$1.20/kg • 0.5 mi away',
      isSnap: false,
    ),
    NearbyAlert(
      emoji: '🔌',
      headline: 'E-Waste Collective is nearby',
      detail: 'Free pickup • 3.0 mi away',
      isSnap: false,
    ),
  ];

  @override
  NearbyAlertState build() {
    // First ping after 3 seconds, then every 8 seconds
    _timer = Timer(const Duration(seconds: 3), _cycle);
    ref.onDispose(() => _timer?.cancel());
    return const NearbyAlertState();
  }

  void _cycle() {
    final alert = _alerts[_alertIndex % _alerts.length];
    _alertIndex++;
    show(alert);

    // Auto-dismiss after 4 seconds, then schedule next
    _timer = Timer(const Duration(milliseconds: 4200), () {
      dismiss();
      _timer = Timer(
        Duration(seconds: 4 + Random().nextInt(5)),
        _cycle,
      );
    });
  }

  void show(NearbyAlert alert) =>
      state = state.copyWith(visible: true, alert: alert);

  void dismiss() => state = state.copyWith(visible: false);
}
