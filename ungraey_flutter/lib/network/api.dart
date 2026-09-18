import 'package:flutter/foundation.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../client.dart';

/// Centralized API singleton wrapping Serverpod client with offline-safe fallbacks.
class Api {
  Api._();
  static final instance = Api._();

  Client get _client => client;

  /// Fetch active bounties with distance and category filtering.
  Future<List<Bounty>> listBounties({
    double? lat,
    double? lon,
    double? radiusMiles,
    MaterialCategory? category,
  }) async {
    try {
      return await _client.bounty.listBounties(
        lat: lat,
        lon: lon,
        radiusMiles: radiusMiles,
        category: category,
      );
    } catch (e) {
      debugPrint('Api.listBounties fallback: $e');
      return _mockBounties;
    }
  }

  /// Create a new bounty.
  Future<Bounty> createBounty(Bounty bounty) async {
    try {
      return await _client.bounty.createBounty(bounty);
    } catch (e) {
      debugPrint('Api.createBounty fallback: $e');
      _mockBounties.insert(0, bounty);
      return bounty;
    }
  }

  /// Submit a snapped pile.
  Future<Snap> submitSnap(Snap snap) async {
    try {
      return await _client.snap.submitSnap(snap);
    } catch (e) {
      debugPrint('Api.submitSnap fallback: $e');
      return snap;
    }
  }

  /// Find matching bounties for a snap.
  Future<List<Bounty>> findMatchesForSnap(int snapId, {double radiusMiles = 5.0}) async {
    try {
      return await _client.snap.findMatchesForSnap(snapId, radiusMiles: radiusMiles);
    } catch (e) {
      debugPrint('Api.findMatchesForSnap fallback: $e');
      return _mockBounties.take(2).toList();
    }
  }

  /// Initiate QR handoff.
  Future<HandoffTransaction> initiateHandoff({
    required int snapId,
    required int bountyId,
    required int sellerId,
  }) async {
    try {
      return await _client.handoff.initiateHandoff(
        snapId: snapId,
        bountyId: bountyId,
        sellerId: sellerId,
      );
    } catch (e) {
      debugPrint('Api.initiateHandoff fallback: $e');
      final token = 'UNGRAEY-${DateTime.now().millisecondsSinceEpoch}-104928';
      return HandoffTransaction(
        snapId: snapId,
        bountyId: bountyId,
        sellerId: sellerId,
        buyerId: 2,
        qrToken: token,
        rewardAmountCents: 500,
        rewardType: RewardType.cash,
        kgDiverted: 14.5,
        co2eSavedKg: 21.75,
        status: 'pending',
        createdAt: DateTime.now(),
      );
    }
  }

  /// Verify and complete QR handoff.
  Future<HandoffTransaction?> verifyAndCompleteHandoff(String qrToken) async {
    try {
      return await _client.handoff.verifyAndCompleteHandoff(qrToken);
    } catch (e) {
      debugPrint('Api.verifyAndCompleteHandoff fallback: $e');
      return HandoffTransaction(
        snapId: 1,
        bountyId: 1,
        sellerId: 1,
        buyerId: 2,
        qrToken: qrToken,
        rewardAmountCents: 500,
        rewardType: RewardType.cash,
        kgDiverted: 14.5,
        co2eSavedKg: 21.75,
        status: 'completed',
        completedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );
    }
  }

  /// Get user impact metrics.
  Future<EcoImpact> getUserImpact(int userId) async {
    try {
      return await _client.impact.getUserImpact(userId);
    } catch (e) {
      debugPrint('Api.getUserImpact fallback: $e');
      return EcoImpact(
        userId: userId,
        totalKgDiverted: 48.2,
        totalCo2eSavedKg: 82.5,
        treesSavedEquivalent: 3.9,
        waterSavedLiters: 720.0,
        pointsBalance: 480,
        completedHandoffsCount: 6,
        updatedAt: DateTime.now(),
      );
    }
  }

  /// Get global community impact metrics.
  Future<EcoImpact> getCommunityImpact() async {
    try {
      return await _client.impact.getCommunityImpact();
    } catch (e) {
      debugPrint('Api.getCommunityImpact fallback: $e');
      return EcoImpact(
        userId: 0,
        totalKgDiverted: 1540.2,
        totalCo2eSavedKg: 2890.5,
        treesSavedEquivalent: 137.6,
        waterSavedLiters: 23100.0,
        pointsBalance: 15400,
        completedHandoffsCount: 84,
        updatedAt: DateTime.now(),
      );
    }
  }

  // Pre-seeded high quality realistic bounties
  static final List<Bounty> _mockBounties = [
    Bounty(
      id: 1,
      creatorId: 101,
      creatorName: 'Clay & Ember Studio',
      title: '50 Clean Glass Jars (16oz+)',
      description: 'Need wide-mouth glass jars for pottery glazes and studio storage.',
      category: MaterialCategory.cleanGlassJars,
      quantityNeeded: 50,
      quantityFulfilled: 12,
      rewardAmountCents: 500,
      rewardType: RewardType.cash,
      tradeItemDescription: null,
      latitude: 37.7760,
      longitude: -122.4200,
      addressSnippet: 'Mission Arts District, SF',
      radiusMiles: 3.0,
      status: 'active',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Bounty(
      id: 2,
      creatorId: 102,
      creatorName: 'Bay Area Upcycled Woodworks',
      title: 'Scrap Hardwood & Pallet Slats',
      description: 'Accepting clean hardwood cuts, oak, walnut, or pine planks.',
      category: MaterialCategory.hardwoodScrap,
      quantityNeeded: 20,
      quantityFulfilled: 5,
      rewardAmountCents: 1500,
      rewardType: RewardType.cash,
      tradeItemDescription: null,
      latitude: 37.7735,
      longitude: -122.4180,
      addressSnippet: 'SoMa Maker Space, SF',
      radiusMiles: 4.5,
      status: 'active',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Bounty(
      id: 3,
      creatorId: 103,
      creatorName: 'GreenMove Co.',
      title: 'Infinite Intact Moving Boxes',
      description: 'Heavy duty corrugated cardboard boxes. Free pickup or trade for tape rolls.',
      category: MaterialCategory.corrugatedCardboard,
      quantityNeeded: 100,
      quantityFulfilled: 42,
      rewardAmountCents: 1000,
      rewardType: RewardType.trade,
      tradeItemDescription: 'Packaging Tape Rolls or Coffee',
      latitude: 37.7790,
      longitude: -122.4220,
      addressSnippet: 'Hayes Valley, SF',
      radiusMiles: 5.0,
      status: 'active',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];
}
