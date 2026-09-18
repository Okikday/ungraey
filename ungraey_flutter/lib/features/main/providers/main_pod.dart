import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_state.dart';

final _mainProvider =
    NotifierProvider.autoDispose<MainPod, MainState>(MainPod.new, name: 'MainPod');

/// Manages root navigation tabs across Snap, Bounties, Impact, and Profile.
class MainPod extends AutoDisposeNotifier<MainState> {
  static final me = _mainProvider;

  @override
  MainState build() {
    return const MainState(selectedIndex: 0);
  }

  void switchTab(int index) {
    if (state.selectedIndex == index) return;
    HapticFeedback.selectionClick();
    state = state.copyWith(selectedIndex: index);
  }
}
