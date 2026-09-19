import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint for handling supply-side waste pile snaps and localized matching.
class SnapEndpoint extends Endpoint {
  /// Records a new snapped waste pile.
  Future<Snap> submitSnap(Session session, Snap snap) async {
    final inserted = await Snap.db.insertRow(session, snap);

    // Broadcast new snap alert to nearby makers
    await session.messages.postMessage(
      'nearby_snaps',
      inserted,
    );

    return inserted;
  }

  /// Analyzes a base64 encoded image to determine its material category and estimated value.
  Future<MaterialAnalysisResult> analyze(Session session, String base64Image) async {
    final apiKey = Platform.environment['GROQ_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('GROQ_API_KEY environment variable is not set.');
    }

    final url = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "llama-3.2-90b-vision-preview",
        "messages": [
          {
            "role": "user",
            "content": [
              {
                "type": "text",
                "text": "Analyze this waste pile image. Identify the primary material category from: corrugatedCardboard, treatedLumber, cleanGlassJars, scrapDenimTextiles, eWaste, other. Estimate the value in cents between 100 and 1500. Return only a JSON object exactly matching this format: {\"category\": \"enumName\", \"confidence\": 0.9, \"estimatedValueCents\": 1200}"
              },
              {
                "type": "image_url",
                "image_url": {
                  "url": "data:image/jpeg;base64,$base64Image"
                }
              }
            ]
          }
        ],
        "temperature": 0.1,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Groq API Error: ${response.statusCode} - ${response.body}');
    }

    final data = jsonDecode(response.body);
    final content = data['choices'][0]['message']['content'] as String;
    
    // Extract JSON part in case the model returns markdown around it
    final jsonStart = content.indexOf('{');
    final jsonEnd = content.lastIndexOf('}');
    if (jsonStart == -1 || jsonEnd == -1) {
      throw Exception('Failed to parse Groq response: $content');
    }
    
    final parsed = jsonDecode(content.substring(jsonStart, jsonEnd + 1));
    final categoryStr = parsed['category'] as String?;
    
    MaterialCategory detectedCategory = MaterialCategory.other;
    for (var value in MaterialCategory.values) {
      if (value.name == categoryStr) {
        detectedCategory = value;
        break;
      }
    }

    final confidence = (parsed['confidence'] as num?)?.toDouble() ?? 0.85;
    final valueCents = (parsed['estimatedValueCents'] as num?)?.toInt() ?? 500;

    return MaterialAnalysisResult(
      detectedCategories: [detectedCategory],
      estimatedValueCents: valueCents,
      confidenceScore: confidence,
    );
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
      final categoryMatches = snap.detectedCategories.contains(bounty.category);
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
    final stream = session.messages.createStream<Bounty>('nearby_bounties');
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
    final a =
        0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 7917.5 * asin(sqrt(a));
  }
}
