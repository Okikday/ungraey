import 'package:equatable/equatable.dart';

/// The four core tabs available in the Ungraey navigation dock.
enum MainTabEntry {
  home,
  bounties,
  snap,
  profile;

  String normalize() => switch (this) {
    home => 'Home',
    bounties => 'Bounties',
    snap => 'Scan',
    profile => 'Profile',
  };
}

/// State of the root navigation shell.
class MainState extends Equatable {
  final MainTabEntry activeTab;

  const MainState({this.activeTab = MainTabEntry.home});

  int get selectedIndex => activeTab.index;

  MainState copyWith({MainTabEntry? activeTab}) {
    return MainState(
      activeTab: activeTab ?? this.activeTab,
    );
  }

  @override
  List<Object?> get props => [activeTab];
}
