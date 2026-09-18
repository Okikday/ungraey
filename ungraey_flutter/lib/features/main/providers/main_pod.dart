import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_state.dart';

final _mainProvider = NotifierProvider.autoDispose<MainPod, MainState>(
  MainPod.new,
  name: 'MainPod',
);

/// Pod managing shell navigation tab switches.
class MainPod extends AutoDisposeNotifier<MainState> {
  static final me = _mainProvider;

  @override
  MainState build() => const MainState();

  void selectTab(MainTabEntry tab) {
    if (state.activeTab != tab) {
      state = state.copyWith(activeTab: tab);
    }
  }

  void setTabIndex(int index) {
    if (index >= 0 && index < MainTabEntry.values.length) {
      selectTab(MainTabEntry.values[index]);
    }
  }
}
