import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../network/api.dart';
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
    Future.microtask(loadBounties);
    return BountiesState(bounties: Api.mockBounties);
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

  /// Fetches bounties from API with current distance and category filters.
  Future<void> loadBounties() async {
    state = state.copyWith(isLoading: true);
    final results = await Api.instance.listBounties(
      radiusMiles: state.radiusMiles,
      category: state.selectedCategory,
    );
    state = state.copyWith(
      bounties: results,
      isLoading: false,
    );
  }

  /// Posts a new commodity bounty and updates the feed.
  Future<Bounty> postBounty(Bounty bounty) async {
    final created = await Api.instance.createBounty(bounty);
    final updatedList = [created, ...state.bounties];
    state = state.copyWith(bounties: updatedList);
    return created;
  }
}
