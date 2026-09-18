import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/floating_pill.dart';
import '../../../../shared/components/gradient_footer.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/bounties_pod.dart';
import '../actions/bounties_actions.dart';
import '../widgets/bounty_card.dart';
import '../widgets/category_filter_pills.dart';

/// Screen presenting local upcycle bounties, category filters, and search.
class BountiesFeedView extends ConsumerWidget {
  const BountiesFeedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pure = context.pureTheme;
    final state = ref.watch(BountiesPod.me);
    final bounties = state.filteredBounties;

    return Scaffold(
      backgroundColor: pure.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top Bar with Search & Filter
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: FloatingSearchFilterPill(
                      placeholder: 'Search 5-mile bounties...',
                      isFilterActive: state.selectedCategory != null,
                      onSearchTap: () {},
                      onFilterTap: () => BountiesActions.openRadiusFilter(context, ref),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () => BountiesActions.openCreateBounty(context, ref),
                    icon: const Icon(Icons.add_circle_outline_rounded),
                    style: IconButton.styleFrom(
                      backgroundColor: pure.primary.withValues(alpha: 0.15),
                      foregroundColor: pure.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Horizontal Category Selector
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CategoryFilterPills(
                selectedCategory: state.selectedCategory,
                onSelect: (cat) =>
                    ref.read(BountiesPod.me.notifier).selectCategory(cat),
              ),
            ),

            // Bounties List
            Expanded(
              child: state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: pure.primary),
                    )
                  : bounties.isEmpty
                      ? Center(
                          child: Text(
                            'No active bounties in this category yet.\nTap + to post one!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: pure.textMuted, fontSize: 13),
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 90),
                          itemCount: bounties.length + 1,
                          itemBuilder: (context, index) {
                            if (index == bounties.length) {
                              return const GradientFooter(label: 'All Nearby Bounties Loaded');
                            }
                            final b = bounties[index];
                            return BountyCard(
                              bounty: b,
                              onTap: () => BountiesActions.openBountyDetails(
                                context,
                                b.id ?? 1,
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
