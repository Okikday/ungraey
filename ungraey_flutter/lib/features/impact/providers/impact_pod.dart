import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../network/api.dart';
import 'impact_state.dart';

final _impactProvider =
    NotifierProvider.autoDispose<ImpactPod, ImpactState>(
  ImpactPod.new,
  name: 'ImpactPod',
);

/// Manages Earth Forward personal and global environmental visualizer statistics.
class ImpactPod extends AutoDisposeNotifier<ImpactState> {
  static final me = _impactProvider;

  @override
  ImpactState build() {
    Future.microtask(loadData);
    return ImpactState(
      userImpact: EcoImpact(
        userId: 1,
        totalKgDiverted: 48.2,
        totalCo2eSavedKg: 82.5,
        treesSavedEquivalent: 3.9,
        waterSavedLiters: 720.0,
        pointsBalance: 480,
        completedHandoffsCount: 6,
        updatedAt: DateTime.now(),
      ),
      communityImpact: EcoImpact(
        userId: 0,
        totalKgDiverted: 1540.2,
        totalCo2eSavedKg: 2890.5,
        treesSavedEquivalent: 137.6,
        waterSavedLiters: 23100.0,
        pointsBalance: 15400,
        completedHandoffsCount: 84,
        updatedAt: DateTime.now(),
      ),
    );
  }

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true);
    final user = await Api.instance.getUserImpact(1);
    final community = await Api.instance.getCommunityImpact();
    state = state.copyWith(
      userImpact: user,
      communityImpact: community,
      isLoading: false,
    );
  }
}
