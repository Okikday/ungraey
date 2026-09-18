import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../network/api.dart';
import 'handoff_state.dart';

final _handoffProvider =
    NotifierProvider.autoDispose<HandoffPod, HandoffState>(
  HandoffPod.new,
  name: 'HandoffPod',
);

/// Manages QR code generation, expiration countdown, and verified settlement.
class HandoffPod extends AutoDisposeNotifier<HandoffState> {
  static final me = _handoffProvider;
  Timer? _timer;

  @override
  HandoffState build() {
    ref.onDispose(() => _timer?.cancel());
    return const HandoffState();
  }

  /// Initiates a handoff transaction for [bountyId].
  Future<HandoffTransaction> initiate(int bountyId) async {
    state = state.copyWith(isGenerating: true);

    final tx = await Api.instance.initiateHandoff(
      snapId: 1,
      bountyId: bountyId,
      sellerId: 1,
    );

    state = state.copyWith(
      isGenerating: false,
      activeTransaction: tx,
      secondsRemaining: 120,
    );

    _startCountdown();
    return tx;
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsRemaining <= 1) {
        timer.cancel();
        state = state.copyWith(secondsRemaining: 0);
      } else {
        state = state.copyWith(secondsRemaining: state.secondsRemaining - 1);
      }
    });
  }

  /// Verifies a scanned QR token and settles the transaction.
  Future<HandoffTransaction?> verify(String qrToken) async {
    state = state.copyWith(isVerifying: true);
    final completed = await Api.instance.verifyAndCompleteHandoff(qrToken);
    state = state.copyWith(
      isVerifying: false,
      isCompleted: completed != null,
      activeTransaction: completed,
    );
    return completed;
  }
}
