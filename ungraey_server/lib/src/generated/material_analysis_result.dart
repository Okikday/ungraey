/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _is;
import 'package:ungraey_server/src/generated/protocol.dart' as _it738mhb;
import 'material_category.dart' as _iljslhxv;

abstract class MaterialAnalysisResult
    implements _is.SerializableModel, _is.ProtocolSerialization {
  MaterialAnalysisResult._({
    required this.detectedCategories,
    required this.estimatedValueCents,
    required this.confidenceScore,
  });

  factory MaterialAnalysisResult({
    required List<_iljslhxv.MaterialCategory> detectedCategories,
    required int estimatedValueCents,
    required double confidenceScore,
  }) = _MaterialAnalysisResultImpl;

  factory MaterialAnalysisResult.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MaterialAnalysisResult(
      detectedCategories: _it738mhb.Protocol()
          .deserialize<List<_iljslhxv.MaterialCategory>>(
            jsonSerialization['detectedCategories'],
          ),
      estimatedValueCents: jsonSerialization['estimatedValueCents'] as int,
      confidenceScore: (jsonSerialization['confidenceScore'] as num).toDouble(),
    );
  }

  List<_iljslhxv.MaterialCategory> detectedCategories;

  int estimatedValueCents;

  double confidenceScore;

  /// Returns a shallow copy of this [MaterialAnalysisResult]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  MaterialAnalysisResult copyWith({
    List<_iljslhxv.MaterialCategory>? detectedCategories,
    int? estimatedValueCents,
    double? confidenceScore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MaterialAnalysisResult',
      'detectedCategories': detectedCategories.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'estimatedValueCents': estimatedValueCents,
      'confidenceScore': confidenceScore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MaterialAnalysisResult',
      'detectedCategories': detectedCategories.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'estimatedValueCents': estimatedValueCents,
      'confidenceScore': confidenceScore,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _MaterialAnalysisResultImpl extends MaterialAnalysisResult {
  _MaterialAnalysisResultImpl({
    required List<_iljslhxv.MaterialCategory> detectedCategories,
    required int estimatedValueCents,
    required double confidenceScore,
  }) : super._(
         detectedCategories: detectedCategories,
         estimatedValueCents: estimatedValueCents,
         confidenceScore: confidenceScore,
       );

  /// Returns a shallow copy of this [MaterialAnalysisResult]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  MaterialAnalysisResult copyWith({
    List<_iljslhxv.MaterialCategory>? detectedCategories,
    int? estimatedValueCents,
    double? confidenceScore,
  }) {
    return MaterialAnalysisResult(
      detectedCategories:
          detectedCategories ??
          this.detectedCategories.map((e0) => e0).toList(),
      estimatedValueCents: estimatedValueCents ?? this.estimatedValueCents,
      confidenceScore: confidenceScore ?? this.confidenceScore,
    );
  }
}
