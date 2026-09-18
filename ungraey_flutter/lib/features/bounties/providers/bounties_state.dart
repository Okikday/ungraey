import 'package:equatable/equatable.dart';
import 'package:ungraey_client/ungraey_client.dart';

/// State of the bounty marketplace feed and filtering.
class BountiesState extends Equatable {
  final List<Bounty> bounties;
  final MaterialCategory? selectedCategory;
  final String searchQuery;
  final double radiusMiles;
  final bool isLoading;

  const BountiesState({
    this.bounties = const [],
    this.selectedCategory,
    this.searchQuery = '',
    this.radiusMiles = 5.0,
    this.isLoading = false,
  });

  List<Bounty> get filteredBounties {
    return bounties.where((b) {
      if (selectedCategory != null && b.category != selectedCategory) {
        return false;
      }
      if (searchQuery.trim().isNotEmpty) {
        final q = searchQuery.toLowerCase().trim();
        final matchesTitle = b.title.toLowerCase().contains(q);
        final matchesDesc = b.description.toLowerCase().contains(q);
        final matchesCreator = b.creatorName.toLowerCase().contains(q);
        if (!matchesTitle && !matchesDesc && !matchesCreator) return false;
      }
      return true;
    }).toList();
  }

  BountiesState copyWith({
    List<Bounty>? bounties,
    MaterialCategory? selectedCategory,
    bool clearCategory = false,
    String? searchQuery,
    double? radiusMiles,
    bool? isLoading,
  }) {
    return BountiesState(
      bounties: bounties ?? this.bounties,
      selectedCategory:
          clearCategory ? null : (selectedCategory ?? this.selectedCategory),
      searchQuery: searchQuery ?? this.searchQuery,
      radiusMiles: radiusMiles ?? this.radiusMiles,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        bounties,
        selectedCategory,
        searchQuery,
        radiusMiles,
        isLoading,
      ];
}
