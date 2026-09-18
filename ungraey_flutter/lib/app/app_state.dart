import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Global application state.
class AppState extends Equatable {
  final ThemeMode themeMode;
  final bool isAuthenticated;
  final int? currentUserId;
  final String currentUserDisplayName;
  final double currentLatitude;
  final double currentLongitude;

  const AppState({
    this.themeMode = ThemeMode.dark,
    this.isAuthenticated = true,
    this.currentUserId = 1,
    this.currentUserDisplayName = 'Alex Rivera',
    this.currentLatitude = 37.7749,
    this.currentLongitude = -122.4194,
  });

  AppState copyWith({
    ThemeMode? themeMode,
    bool? isAuthenticated,
    int? currentUserId,
    String? currentUserDisplayName,
    double? currentLatitude,
    double? currentLongitude,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      currentUserId: currentUserId ?? this.currentUserId,
      currentUserDisplayName:
          currentUserDisplayName ?? this.currentUserDisplayName,
      currentLatitude: currentLatitude ?? this.currentLatitude,
      currentLongitude: currentLongitude ?? this.currentLongitude,
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
        isAuthenticated,
        currentUserId,
        currentUserDisplayName,
        currentLatitude,
        currentLongitude,
      ];
}
