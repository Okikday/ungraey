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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class EcoImpact
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  EcoImpact._({
    this.id,
    required this.userId,
    double? totalKgDiverted,
    double? totalCo2eSavedKg,
    double? treesSavedEquivalent,
    double? waterSavedLiters,
    int? pointsBalance,
    int? completedHandoffsCount,
    DateTime? updatedAt,
  }) : totalKgDiverted = totalKgDiverted ?? 0.0,
       totalCo2eSavedKg = totalCo2eSavedKg ?? 0.0,
       treesSavedEquivalent = treesSavedEquivalent ?? 0.0,
       waterSavedLiters = waterSavedLiters ?? 0.0,
       pointsBalance = pointsBalance ?? 0,
       completedHandoffsCount = completedHandoffsCount ?? 0,
       updatedAt = updatedAt ?? DateTime.now();

  factory EcoImpact({
    int? id,
    required int userId,
    double? totalKgDiverted,
    double? totalCo2eSavedKg,
    double? treesSavedEquivalent,
    double? waterSavedLiters,
    int? pointsBalance,
    int? completedHandoffsCount,
    DateTime? updatedAt,
  }) = _EcoImpactImpl;

  factory EcoImpact.fromJson(Map<String, dynamic> jsonSerialization) {
    return EcoImpact(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      totalKgDiverted: (jsonSerialization['totalKgDiverted'] as num?)
          ?.toDouble(),
      totalCo2eSavedKg: (jsonSerialization['totalCo2eSavedKg'] as num?)
          ?.toDouble(),
      treesSavedEquivalent: (jsonSerialization['treesSavedEquivalent'] as num?)
          ?.toDouble(),
      waterSavedLiters: (jsonSerialization['waterSavedLiters'] as num?)
          ?.toDouble(),
      pointsBalance: jsonSerialization['pointsBalance'] as int?,
      completedHandoffsCount:
          jsonSerialization['completedHandoffsCount'] as int?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  double totalKgDiverted;

  double totalCo2eSavedKg;

  double treesSavedEquivalent;

  double waterSavedLiters;

  int pointsBalance;

  int completedHandoffsCount;

  DateTime updatedAt;

  /// Returns a shallow copy of this [EcoImpact]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  EcoImpact copyWith({
    int? id,
    int? userId,
    double? totalKgDiverted,
    double? totalCo2eSavedKg,
    double? treesSavedEquivalent,
    double? waterSavedLiters,
    int? pointsBalance,
    int? completedHandoffsCount,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EcoImpact',
      if (id != null) 'id': id,
      'userId': userId,
      'totalKgDiverted': totalKgDiverted,
      'totalCo2eSavedKg': totalCo2eSavedKg,
      'treesSavedEquivalent': treesSavedEquivalent,
      'waterSavedLiters': waterSavedLiters,
      'pointsBalance': pointsBalance,
      'completedHandoffsCount': completedHandoffsCount,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EcoImpact',
      if (id != null) 'id': id,
      'userId': userId,
      'totalKgDiverted': totalKgDiverted,
      'totalCo2eSavedKg': totalCo2eSavedKg,
      'treesSavedEquivalent': treesSavedEquivalent,
      'waterSavedLiters': waterSavedLiters,
      'pointsBalance': pointsBalance,
      'completedHandoffsCount': completedHandoffsCount,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EcoImpactImpl extends EcoImpact {
  _EcoImpactImpl({
    int? id,
    required int userId,
    double? totalKgDiverted,
    double? totalCo2eSavedKg,
    double? treesSavedEquivalent,
    double? waterSavedLiters,
    int? pointsBalance,
    int? completedHandoffsCount,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         totalKgDiverted: totalKgDiverted,
         totalCo2eSavedKg: totalCo2eSavedKg,
         treesSavedEquivalent: treesSavedEquivalent,
         waterSavedLiters: waterSavedLiters,
         pointsBalance: pointsBalance,
         completedHandoffsCount: completedHandoffsCount,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [EcoImpact]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  EcoImpact copyWith({
    Object? id = _Undefined,
    int? userId,
    double? totalKgDiverted,
    double? totalCo2eSavedKg,
    double? treesSavedEquivalent,
    double? waterSavedLiters,
    int? pointsBalance,
    int? completedHandoffsCount,
    DateTime? updatedAt,
  }) {
    return EcoImpact(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      totalKgDiverted: totalKgDiverted ?? this.totalKgDiverted,
      totalCo2eSavedKg: totalCo2eSavedKg ?? this.totalCo2eSavedKg,
      treesSavedEquivalent: treesSavedEquivalent ?? this.treesSavedEquivalent,
      waterSavedLiters: waterSavedLiters ?? this.waterSavedLiters,
      pointsBalance: pointsBalance ?? this.pointsBalance,
      completedHandoffsCount:
          completedHandoffsCount ?? this.completedHandoffsCount,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
