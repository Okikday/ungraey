import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_state.dart';

final _profileProvider =
    NotifierProvider.autoDispose<ProfilePod, ProfileState>(
  ProfilePod.new,
  name: 'ProfilePod',
);

/// Manages profile identity, user ratings, and cash balance.
class ProfilePod extends AutoDisposeNotifier<ProfileState> {
  static final me = _profileProvider;

  @override
  ProfileState build() {
    return const ProfileState();
  }
}
