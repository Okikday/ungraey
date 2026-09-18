import 'dart:math';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint managing demand-side bounties for upcyclable commodities.
class BountyEndpoint extends Endpoint {
  /// Posts a new commodity bounty.
  Future<Bounty> createBounty(Session session, Bounty bounty) async {
    final inserted = await Bounty.db.insertRow(session, bounty);

    // Broadcast new bounty event to real-time subscribers
    await session.messages.postMessage(
      'nearby_bounties',
      inserted,
    );

    return inserted;
  }

  /// Lists active bounties, optionally filtered by proximity and category.
  Future<List<Bounty>> listBounties(
    Session session, {
    double? lat,
    double? lon,
    double? radiusMiles,
    MaterialCategory? category,
  }) async {
    final allBounties = await Bounty.db.find(
      session,
      where: (t) =>
          t.status.equals('active') &
          (category != null
              ? t.category.equals(category)
              : Constant.bool(true)),
      orderBy: (t) => t.createdAt.desc(),
    );

    if (lat == null || lon == null || radiusMiles == null) {
      return allBounties;
    }

    // Filter by Haversine distance
    return allBounties.where((bounty) {
      final distance = _calculateHaversineMiles(
        lat,
        lon,
        bounty.latitude,
        bounty.longitude,
      );
      return distance <= radiusMiles;
    }).toList();
  }

  /// Retrieves a specific bounty by [id].
  Future<Bounty?> getBounty(Session session, int id) async {
    return await Bounty.db.findById(session, id);
  }

  /// Cancels an active bounty.
  Future<bool> cancelBounty(Session session, int id) async {
    final bounty = await Bounty.db.findById(session, id);
    if (bounty == null) return false;

    final updated = bounty.copyWith(status: 'cancelled');
    await Bounty.db.updateRow(session, updated);
    return true;
  }

  double _calculateHaversineMiles(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const p = 0.017453292519943295; // Math.PI / 180
    final a =
        0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    // 12742 km * 0.621371 = ~7917.5 miles
    return 7917.5 * asin(sqrt(a));
  }
}
