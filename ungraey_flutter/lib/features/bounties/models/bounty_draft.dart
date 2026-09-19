import 'package:ungraey_client/ungraey_client.dart';

/// Prefill for the bounty composer when listing a snapped pile.
///
/// Carries the AI-suggested category, a title starter, and the market
/// guide's typical asking price so sellers never start from a blank form.
class BountyDraft {
  final MaterialCategory category;
  final String titleHint;
  final int rewardDollars;

  const BountyDraft({
    required this.category,
    required this.titleHint,
    required this.rewardDollars,
  });
}
