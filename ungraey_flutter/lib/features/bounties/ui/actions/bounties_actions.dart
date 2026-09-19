import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/bounty_draft.dart';
import '../../providers/bounties_pod.dart';
import '../screens/bounty_detail_view.dart';
import '../screens/create_bounty_view.dart';

/// Action handlers for the bounty marketplace.
class BountiesActions {
  const BountiesActions._();

  /// Opens the modal sheet to create a new commodity bounty,
  /// optionally prefilled from a snapped pile via [draft].
  static void openCreateBounty(
    BuildContext context,
    WidgetRef ref, {
    BountyDraft? draft,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CreateBountyModal(draft: draft),
    );
  }

  /// Opens the detail view for a specific bounty.
  static void openBountyDetails(BuildContext context, int bountyId) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BountyDetailModal(bountyId: bountyId),
    );
  }

  /// Opens the radius filter dialog.
  static void openRadiusFilter(BuildContext context, WidgetRef ref) {
    final current = ref.read(BountiesPod.me).radiusMiles;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _RadiusFilterSheet(initialRadius: current),
    );
  }
}

class _RadiusFilterSheet extends ConsumerStatefulWidget {
  final double initialRadius;
  const _RadiusFilterSheet({required this.initialRadius});

  @override
  ConsumerState<_RadiusFilterSheet> createState() => _RadiusFilterSheetState();
}

class _RadiusFilterSheetState extends ConsumerState<_RadiusFilterSheet> {
  late double _radius;

  @override
  void initState() {
    super.initState();
    _radius = widget.initialRadius;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xFF161E1A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search Proximity Radius',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${_radius.toInt()} miles from your current location',
            style: const TextStyle(color: Color(0xFF10B981), fontSize: 14),
          ),
          Slider(
            value: _radius,
            min: 1.0,
            max: 25.0,
            divisions: 24,
            activeColor: const Color(0xFF10B981),
            onChanged: (v) => setState(() => _radius = v),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                ref.read(BountiesPod.me.notifier).setRadius(_radius);
                Navigator.pop(context);
              },
              child: const Text(
                'Apply Filter',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
