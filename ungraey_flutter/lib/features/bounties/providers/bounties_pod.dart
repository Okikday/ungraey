import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../network/api.dart';
import '../logic/bounty_local_store.dart';
import 'bounties_state.dart';

final _bountiesProvider =
    NotifierProvider.autoDispose<BountiesPod, BountiesState>(
      BountiesPod.new,
      name: 'BountiesPod',
    );

/// Manages the bounty marketplace feed, distance filtering, search, and posting.
class BountiesPod extends AutoDisposeNotifier<BountiesState> {
  static final me = _bountiesProvider;

  @override
  BountiesState build() {
    Future.microtask(_init);
    return BountiesState(bounties: Api.mockBounties);
  }

  /// Merges persisted user bounties over the seed feed, then refreshes.
  Future<void> _init() async {
    final mine = await BountyLocalStore.loadMine();
    if (mine.isNotEmpty) {
      state = state.copyWith(bounties: [...mine, ...state.bounties]);
    }
    await loadBounties();
  }

  void updateSearch(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void selectCategory(MaterialCategory? category) {
    if (state.selectedCategory == category) {
      state = state.copyWith(clearCategory: true);
    } else {
      state = state.copyWith(selectedCategory: category);
    }
  }

  void setRadius(double miles) {
    state = state.copyWith(radiusMiles: miles);
    loadBounties();
  }

  /// Fetches bounties, keeping persisted user posts pinned on top.
  Future<void> loadBounties() async {
    state = state.copyWith(isLoading: true);
    final results = await Api.instance.listBounties(
      radiusMiles: state.radiusMiles,
      category: state.selectedCategory,
    );
    final mine = await BountyLocalStore.loadMine();
    final mineIds = mine.map((b) => b.id).toSet();
    state = state.copyWith(
      bounties: [
        ...mine,
        ...results.where((b) => !mineIds.contains(b.id)),
      ],
      isLoading: false,
    );
  }

  /// Posts a new commodity bounty, persists it on-device, and updates feed.
  Future<Bounty> postBounty(Bounty bounty) async {
    final local = bounty.id == null
        ? bounty.copyWith(id: -DateTime.now().millisecondsSinceEpoch)
        : bounty;
    final created = await Api.instance.createBounty(local);
    final effective = created.id == null ? local : created;
    final mine = [...await BountyLocalStore.loadMine(), effective];
    await BountyLocalStore.saveMine(mine);
    final updatedList = [effective, ...state.bounties];
    state = state.copyWith(bounties: updatedList);
    return effective;
  }
}
