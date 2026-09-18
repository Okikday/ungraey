import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_state.dart';

final _appProvider = NotifierProvider<AppPod, AppState>(
  AppPod.new,
  name: 'AppPod',
);

/// Root application state provider managing theme and active user session.
class AppPod extends Notifier<AppState> {
  static final me = _appProvider;

  @override
  AppState build() {
    return const AppState();
  }

  void toggleTheme() {
    state = state.copyWith(
      themeMode: state.themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark,
    );
  }

  void setLocation(double lat, double lon) {
    state = state.copyWith(currentLatitude: lat, currentLongitude: lon);
  }
}
