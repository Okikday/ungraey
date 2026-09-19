import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ungraey_client/ungraey_client.dart';
import 'package:ungraey_flutter/core/enums/material_category.dart';
import 'package:ungraey_flutter/features/bounties/providers/bounties_pod.dart';
import 'package:ungraey_flutter/features/handoff/providers/handoff_pod.dart';
import 'package:ungraey_flutter/features/impact/ui/widgets/city_live_pulse_badge.dart';
import 'package:ungraey_flutter/features/main/ui/widgets/nearby_alert_pill_overlay.dart';
import 'package:ungraey_flutter/features/snap/logic/material_classifier.dart';
import 'package:ungraey_flutter/features/snap/providers/snap_pod.dart';
import 'package:ungraey_flutter/features/snap/ui/widgets/ai_match_score_ring.dart';
import 'package:ungraey_flutter/network/api.dart';
import 'package:ungraey_flutter/shared/theme/app_theme.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('Material Classifier & AI Snap Logic', () {
    test('classifier produces bounding regions with high confidence', () async {
      const classifier = MaterialClassifier();
      final regions = await classifier.classifyImage();

      expect(regions.isNotEmpty, isTrue);
      for (final r in regions) {
        expect(r.confidence, greaterThanOrEqualTo(0.85));
        expect(r.estimatedKg, greaterThan(0));
        expect(r.category.displayName.isNotEmpty, isTrue);
      }
    });

    test(
      'SnapPod captureAndMatch generates matching bounties and earnings',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        // Keep autoDispose notifier alive during asynchronous capture
        final sub = container.listen(SnapPod.me, (_, _) {});
        addTearDown(sub.close);

        final notifier = container.read(SnapPod.me.notifier);
        await notifier.captureAndMatch();

        final state = container.read(SnapPod.me);
        expect(state.hasCaptured, isTrue);
        expect(state.detectedRegions.isNotEmpty, isTrue);
        expect(state.matchingBounties.isNotEmpty, isTrue);
        expect(state.totalPotentialEarningsCents, greaterThan(0));
        expect(state.estimatedTotalKg, greaterThan(0));
      },
    );
  });

  group('Bounties Marketplace Pod', () {
    test('initializes immediately with mock bounties for zero-delay feed', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(BountiesPod.me);
      expect(state.bounties.isNotEmpty, isTrue);
      expect(state.filteredBounties.length, equals(state.bounties.length));
    });

    test('filters bounties by search query correctly', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(BountiesPod.me.notifier);
      notifier.updateSearch('Glass Jars');

      final state = container.read(BountiesPod.me);
      expect(
        state.filteredBounties.every(
          (b) =>
              b.title.toLowerCase().contains('glass') ||
              b.description.toLowerCase().contains('glass'),
        ),
        isTrue,
      );
    });

    test('posts a new bounty and prepends to feed', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final initialCount = container.read(BountiesPod.me).bounties.length;
      final newBounty = Bounty(
        creatorId: 1,
        creatorName: 'Test Creator',
        title: 'Fresh Copper Wire Scrap',
        description: 'Clean stripped copper.',
        category: MaterialCategory.electronicsScrap,
        quantityNeeded: 10,
        rewardAmountCents: 3000,
        rewardType: RewardType.cash,
        latitude: 37.77,
        longitude: -122.42,
        addressSnippet: 'SoMa, SF',
        radiusMiles: 3.0,
        status: 'active',
        createdAt: DateTime.now(),
      );

      final created = await container
          .read(BountiesPod.me.notifier)
          .postBounty(newBounty);
      expect(created.title, equals('Fresh Copper Wire Scrap'));

      final state = container.read(BountiesPod.me);
      expect(state.bounties.length, equals(initialCount + 1));
      expect(state.bounties.first.title, equals('Fresh Copper Wire Scrap'));
    });
  });

  group('Handoff & Settlement Flow', () {
    test('initiates and settles cryptographic handoff successfully', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(HandoffPod.me.notifier);
      final initiatedTx = await notifier.initiate(1);

      expect(initiatedTx.qrToken.startsWith('UNGRAEY-'), isTrue);
      expect(initiatedTx.kgDiverted, greaterThan(0));

      final completedTx = await notifier.verify(initiatedTx.qrToken);
      expect(completedTx, isNotNull);
      expect(completedTx!.status, equals('completed'));

      final state = container.read(HandoffPod.me);
      expect(state.isCompleted, isTrue);
    });
  });

  group('Offline Fallback Guarantees', () {
    test(
      'Api.instance returns valid mock data when backend unseeded',
      () async {
        final bounties = await Api.instance.listBounties();
        expect(bounties.isNotEmpty, isTrue);

        final userImpact = await Api.instance.getUserImpact(1);
        expect(userImpact.totalKgDiverted, greaterThan(0));

        final commImpact = await Api.instance.getCommunityImpact();
        expect(commImpact.totalKgDiverted, greaterThan(0));
      },
    );
  });

  group('Wow UI Components', () {
    testWidgets('AiMatchScoreRing renders with score percentage', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.dark,
          home: const Scaffold(
            body: Center(
              child: AiMatchScoreRing(score: 0.94, size: 70),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(AiMatchScoreRing), findsOneWidget);
      expect(find.text('94%'), findsOneWidget);
    });

    testWidgets('CityLivePulseBadge mounts and renders rolling event text', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.dark,
          home: const Scaffold(
            body: Center(
              child: CityLivePulseBadge(),
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byType(CityLivePulseBadge), findsOneWidget);

      // Unmount and pump out remaining frame
      await tester.pumpWidget(const Placeholder());
      await tester.pump(const Duration(milliseconds: 50));
    });

    testWidgets('NearbyAlertPillOverlay mounts inside ProviderScope', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.dark,
            home: const Scaffold(
              body: Stack(
                children: [
                  NearbyAlertPillOverlay(),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byType(NearbyAlertPillOverlay), findsOneWidget);

      // Unmount and pump out frame
      await tester.pumpWidget(const Placeholder());
      await tester.pump(const Duration(milliseconds: 50));
    });
  });
}
