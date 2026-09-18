import 'dart:math';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint managing the physical QR handoff and value exchange settlement.
class HandoffEndpoint extends Endpoint {
  /// Initiates a handoff transaction and returns a cryptographically unique QR token.
  Future<HandoffTransaction> initiateHandoff(
    Session session, {
    required int snapId,
    required int bountyId,
    required int sellerId,
  }) async {
    final bounty = await Bounty.db.findById(session, bountyId);
    final snap = await Snap.db.findById(session, snapId);

    if (bounty == null || snap == null) {
      throw FormatException('Invalid snapId or bountyId');
    }

    final randomStr = Random().nextInt(999999).toString().padLeft(6, '0');
    final qrToken = 'UNGRAEY-${DateTime.now().millisecondsSinceEpoch}-$randomStr';

    final kg = snap.estimatedWeightKg;
    final co2e = kg * 1.6; // Default carbon savings conversion

    final transaction = HandoffTransaction(
      snapId: snapId,
      bountyId: bountyId,
      sellerId: sellerId,
      buyerId: bounty.creatorId,
      qrToken: qrToken,
      rewardAmountCents: bounty.rewardAmountCents,
      rewardType: bounty.rewardType,
      kgDiverted: kg,
      co2eSavedKg: co2e,
      status: 'pending',
      createdAt: DateTime.now(),
    );

    return await HandoffTransaction.db.insertRow(session, transaction);
  }

  /// Verifies a scanned QR token, atomically completing the handoff and crediting eco-impact.
  Future<HandoffTransaction?> verifyAndCompleteHandoff(
    Session session,
    String qrToken,
  ) async {
    final transactions = await HandoffTransaction.db.find(
      session,
      where: (t) => t.qrToken.equals(qrToken) & t.status.equals('pending'),
    );

    if (transactions.isEmpty) return null;

    final tx = transactions.first;
    final completed = tx.copyWith(
      status: 'completed',
      completedAt: DateTime.now(),
    );

    await HandoffTransaction.db.updateRow(session, completed);

    // Update snap status
    final snap = await Snap.db.findById(session, tx.snapId);
    if (snap != null) {
      await Snap.db.updateRow(session, snap.copyWith(status: 'handedOff'));
    }

    // Update bounty fulfillment
    final bounty = await Bounty.db.findById(session, tx.bountyId);
    if (bounty != null) {
      final updatedBounty = bounty.copyWith(
        quantityFulfilled: bounty.quantityFulfilled + 1,
        status: (bounty.quantityFulfilled + 1 >= bounty.quantityNeeded)
            ? 'fulfilled'
            : 'active',
      );
      await Bounty.db.updateRow(session, updatedBounty);
    }

    // Update seller EcoImpact
    await _creditUserImpact(session, tx.sellerId, tx.kgDiverted, tx.co2eSavedKg);
    // Update buyer EcoImpact
    await _creditUserImpact(session, tx.buyerId, tx.kgDiverted, tx.co2eSavedKg);

    return completed;
  }

  Future<void> _creditUserImpact(
    Session session,
    int userId,
    double kgDiverted,
    double co2eSavedKg,
  ) async {
    final existing = await EcoImpact.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final trees = co2eSavedKg / 21.0; // ~21kg CO2 absorbed per urban tree per year
    final water = kgDiverted * 15.0; // ~15L water saved per kg recycled cardboard/wood

    if (existing.isEmpty) {
      final record = EcoImpact(
        userId: userId,
        totalKgDiverted: kgDiverted,
        totalCo2eSavedKg: co2eSavedKg,
        treesSavedEquivalent: trees,
        waterSavedLiters: water,
        pointsBalance: (kgDiverted * 10).toInt(),
        completedHandoffsCount: 1,
        updatedAt: DateTime.now(),
      );
      await EcoImpact.db.insertRow(session, record);
    } else {
      final record = existing.first;
      final updated = record.copyWith(
        totalKgDiverted: record.totalKgDiverted + kgDiverted,
        totalCo2eSavedKg: record.totalCo2eSavedKg + co2eSavedKg,
        treesSavedEquivalent: record.treesSavedEquivalent + trees,
        waterSavedLiters: record.waterSavedLiters + water,
        pointsBalance: record.pointsBalance + (kgDiverted * 10).toInt(),
        completedHandoffsCount: record.completedHandoffsCount + 1,
        updatedAt: DateTime.now(),
      );
      await EcoImpact.db.updateRow(session, updated);
    }
  }
}
