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
import 'package:ungraey_client/src/protocol/protocol.dart' as _iyetme0j;
import 'material_category.dart' as _iljslhxv;

abstract class Snap
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Snap._({
    this.id,
    required this.userId,
    required this.imageUrl,
    required this.detectedCategories,
    required this.detectedLabels,
    required this.estimatedWeightKg,
    required this.latitude,
    required this.longitude,
    String? status,
    DateTime? createdAt,
  }) : status = status ?? 'available',
       createdAt = createdAt ?? DateTime.now();

  factory Snap({
    int? id,
    required int userId,
    required String imageUrl,
    required List<_iljslhxv.MaterialCategory> detectedCategories,
    required List<String> detectedLabels,
    required double estimatedWeightKg,
    required double latitude,
    required double longitude,
    String? status,
    DateTime? createdAt,
  }) = _SnapImpl;

  factory Snap.fromJson(Map<String, dynamic> jsonSerialization) {
    return Snap(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String,
      detectedCategories: _iyetme0j.Protocol()
          .deserialize<List<_iljslhxv.MaterialCategory>>(
            jsonSerialization['detectedCategories'],
          ),
      detectedLabels: _iyetme0j.Protocol().deserialize<List<String>>(
        jsonSerialization['detectedLabels'],
      ),
      estimatedWeightKg: (jsonSerialization['estimatedWeightKg'] as num)
          .toDouble(),
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      status: jsonSerialization['status'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String imageUrl;

  List<_iljslhxv.MaterialCategory> detectedCategories;

  List<String> detectedLabels;

  double estimatedWeightKg;

  double latitude;

  double longitude;

  String status;

  DateTime createdAt;

  /// Returns a shallow copy of this [Snap]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Snap copyWith({
    int? id,
    int? userId,
    String? imageUrl,
    List<_iljslhxv.MaterialCategory>? detectedCategories,
    List<String>? detectedLabels,
    double? estimatedWeightKg,
    double? latitude,
    double? longitude,
    String? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Snap',
      if (id != null) 'id': id,
      'userId': userId,
      'imageUrl': imageUrl,
      'detectedCategories': detectedCategories.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'detectedLabels': detectedLabels.toJson(),
      'estimatedWeightKg': estimatedWeightKg,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Snap',
      if (id != null) 'id': id,
      'userId': userId,
      'imageUrl': imageUrl,
      'detectedCategories': detectedCategories.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'detectedLabels': detectedLabels.toJson(),
      'estimatedWeightKg': estimatedWeightKg,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SnapImpl extends Snap {
  _SnapImpl({
    int? id,
    required int userId,
    required String imageUrl,
    required List<_iljslhxv.MaterialCategory> detectedCategories,
    required List<String> detectedLabels,
    required double estimatedWeightKg,
    required double latitude,
    required double longitude,
    String? status,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         imageUrl: imageUrl,
         detectedCategories: detectedCategories,
         detectedLabels: detectedLabels,
         estimatedWeightKg: estimatedWeightKg,
         latitude: latitude,
         longitude: longitude,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Snap]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Snap copyWith({
    Object? id = _Undefined,
    int? userId,
    String? imageUrl,
    List<_iljslhxv.MaterialCategory>? detectedCategories,
    List<String>? detectedLabels,
    double? estimatedWeightKg,
    double? latitude,
    double? longitude,
    String? status,
    DateTime? createdAt,
  }) {
    return Snap(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      imageUrl: imageUrl ?? this.imageUrl,
      detectedCategories:
          detectedCategories ??
          this.detectedCategories.map((e0) => e0).toList(),
      detectedLabels:
          detectedLabels ?? this.detectedLabels.map((e0) => e0).toList(),
      estimatedWeightKg: estimatedWeightKg ?? this.estimatedWeightKg,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
