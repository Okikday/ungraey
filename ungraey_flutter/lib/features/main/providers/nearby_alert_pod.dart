import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'nearby_alert_state.dart';

final _nearbyAlertProvider =
    NotifierProvider.autoDispose<NearbyAlertPod, NearbyAlertState>(
      NearbyAlertPod.new,
      name: 'NearbyAlertPod',
    );

/// Surfaces real nearby bounty + snap events as an auto-dismissing pill.
///
/// Shows one orientation ping on launch, then stays silent unless a real
/// event arrives via [show]. Never loops or fabricates recurring alerts.
class NearbyAlertPod extends AutoDisposeNotifier<NearbyAlertState> {
  static final me = _nearbyAlertProvider;

  Timer? _timer;

  static const _welcome = NearbyAlert(
    emoji: '👋',
    headline: 'Welcome to Ungraey — don\'t trash it, cash it',
    detail: 'Snap a pile to see what it\'s worth',
    isSnap: true,
  );

  @override
  NearbyAlertState build() {
    // Single orientation ping, then silence.
    _timer = Timer(const Duration(milliseconds: 2500), () {
      show(_welcome);
      _timer = Timer(const Duration(seconds: 4), dismiss);
    });
    ref.onDispose(() => _timer?.cancel());
    return const NearbyAlertState();
  }

  void show(NearbyAlert alert) =>
      state = state.copyWith(visible: true, alert: alert);

  void dismiss() => state = state.copyWith(visible: false);
}
