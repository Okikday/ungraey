import 'package:flutter/material.dart';
import '../../../../shared/components/section_header.dart';
import '../../../handoff/ui/actions/handoff_actions.dart';
import 'ongoing_exchange_tile.dart';

/// Section showing active waste handoffs and exchanges.
class OngoingExchangesSection extends StatelessWidget {
  const OngoingExchangesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Active Exchanges',
          actionLabel: 'View all',
        ),
        const SizedBox(height: 10),
        OngoingExchangeTile(
          title: '50 Clean Glass Jars',
          partner: 'Ceramics Studio 9 • 1.2 mi away',
          status: 'QR Generated • Awaiting buyer scan',
          progress: 0.85,
          emoji: '🫙',
          onTap: () => HandoffActions.openShowQr(context, 1),
        ),
        const SizedBox(height: 10),
        OngoingExchangeTile(
          title: '15 Intact Moving Boxes',
          partner: 'Mission Bay Movers • 0.8 mi away',
          status: 'Match Accepted • Ready for drop-off',
          progress: 0.50,
          emoji: '📦',
          onTap: () => HandoffActions.openShowQr(context, 2),
        ),
      ],
    );
  }
}
