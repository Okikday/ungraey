import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungraey_client/ungraey_client.dart';

/// On-device persistence for bounties the user posted.
///
/// Server data is unavailable offline and in-memory mocks vanish on
/// restart, so user-authored bounties are journaled here and merged
/// back into the feed on launch. All failures are silent by design —
/// persistence must never break posting or tests.
class BountyLocalStore {
  const BountyLocalStore._();

  static const _key = 'ungraey_my_bounties_v1';

  /// Returns previously posted user bounties, newest first.
  static Future<List<Bounty>> loadMine() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw == null || raw.isEmpty) return const [];
      final decoded = jsonDecode(raw) as List;
      final bounties = <Bounty>[];
      for (final item in decoded) {
        try {
          final bounty = Bounty.fromJson(
            Map<String, dynamic>.from(item as Map),
          );
          if (bounty.title.isNotEmpty) bounties.add(bounty);
        } catch (_) {
          // Skip corrupt entries, keep the rest.
        }
      }
      return bounties;
    } catch (_) {
      return const [];
    }
  }

  /// Replaces the stored user bounties with [mine].
  static Future<void> saveMine(List<Bounty> mine) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = jsonEncode(mine.map((b) => b.toJson()).toList());
      await prefs.setString(_key, raw);
    } catch (_) {
      // Persistence is best-effort only.
    }
  }
}
