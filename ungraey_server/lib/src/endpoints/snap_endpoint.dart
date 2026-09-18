import 'dart:math';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint for handling supply-side waste pile snaps and localized matching.
class SnapEndpoint extends Endpoint {
  /// Records a new snapped waste pile.
  Future<Snap> submitSnap(Session session, Snap snap) async {
    final inserted = await Snap.db.insertRow(session, snap);

    // Broadcast new snap alert to nearby makers
    session.messages.postMessage(
      'nearby_snaps',
      inserted,
    );

    return inserted;
  }

  /// Finds all active bounties matching the snap's detected materials within [radiusMiles].
  Future<List<Bounty>> findMatchesForSnap(
    Session session,
    int snapId, {
    double radiusMiles = 5.0,
  }) async {
    final snap = await Snap.db.findById(session, snapId);
    if (snap == null) return [];

    final activeBounties = await Bounty.db.find(
      session,
      where: (t) => t.status.equals('active'),
    );

    final matching = activeBounties.where((bounty) {
      final categoryMatches =
          snap.detectedCategories.contains(bounty.category);
      if (!categoryMatches) return false;

      final distance = _calculateHaversineMiles(
        snap.latitude,
        snap.longitude,
        bounty.latitude,
        bounty.longitude,
      );
      return distance <= radiusMiles;
    }).toList();

    return matching;
  }

  /// Real-time stream of nearby bounty alerts.
  Stream<Bounty> streamNearbyBounties(Session session) async* {
    final stream =
        session.messages.createStream<Bounty>('nearby_bounties');
    await for (final bounty in stream) {
      yield bounty;
    }
  }

  double _calculateHaversineMiles(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 7917.5 * asin(sqrt(a));
  }
}
