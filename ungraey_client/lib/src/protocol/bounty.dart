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
import 'material_category.dart' as _iljslhxv;
import 'reward_type.dart' as _isy11kxj;

abstract class Bounty
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Bounty._({
    this.id,
    required this.creatorId,
    required this.creatorName,
    required this.title,
    required this.description,
    required this.category,
    required this.quantityNeeded,
    int? quantityFulfilled,
    required this.rewardAmountCents,
    required this.rewardType,
    this.tradeItemDescription,
    required this.latitude,
    required this.longitude,
    required this.addressSnippet,
    double? radiusMiles,
    String? status,
    DateTime? createdAt,
  }) : quantityFulfilled = quantityFulfilled ?? 0,
       radiusMiles = radiusMiles ?? 5.0,
       status = status ?? 'active',
       createdAt = createdAt ?? DateTime.now();

  factory Bounty({
    int? id,
    required int creatorId,
    required String creatorName,
    required String title,
    required String description,
    required _iljslhxv.MaterialCategory category,
    required int quantityNeeded,
    int? quantityFulfilled,
    required int rewardAmountCents,
    required _isy11kxj.RewardType rewardType,
    String? tradeItemDescription,
    required double latitude,
    required double longitude,
    required String addressSnippet,
    double? radiusMiles,
    String? status,
    DateTime? createdAt,
  }) = _BountyImpl;

  factory Bounty.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bounty(
      id: jsonSerialization['id'] as int?,
      creatorId: jsonSerialization['creatorId'] as int,
      creatorName: jsonSerialization['creatorName'] as String,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: _iljslhxv.MaterialCategory.fromJson(
        (jsonSerialization['category'] as String),
      ),
      quantityNeeded: jsonSerialization['quantityNeeded'] as int,
      quantityFulfilled: jsonSerialization['quantityFulfilled'] as int?,
      rewardAmountCents: jsonSerialization['rewardAmountCents'] as int,
      rewardType: _isy11kxj.RewardType.fromJson(
        (jsonSerialization['rewardType'] as String),
      ),
      tradeItemDescription:
          jsonSerialization['tradeItemDescription'] as String?,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      addressSnippet: jsonSerialization['addressSnippet'] as String,
      radiusMiles: (jsonSerialization['radiusMiles'] as num?)?.toDouble(),
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

  int creatorId;

  String creatorName;

  String title;

  String description;

  _iljslhxv.MaterialCategory category;

  int quantityNeeded;

  int quantityFulfilled;

  int rewardAmountCents;

  _isy11kxj.RewardType rewardType;

  String? tradeItemDescription;

  double latitude;

  double longitude;

  String addressSnippet;

  double radiusMiles;

  String status;

  DateTime createdAt;

  /// Returns a shallow copy of this [Bounty]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Bounty copyWith({
    int? id,
    int? creatorId,
    String? creatorName,
    String? title,
    String? description,
    _iljslhxv.MaterialCategory? category,
    int? quantityNeeded,
    int? quantityFulfilled,
    int? rewardAmountCents,
    _isy11kxj.RewardType? rewardType,
    String? tradeItemDescription,
    double? latitude,
    double? longitude,
    String? addressSnippet,
    double? radiusMiles,
    String? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Bounty',
      if (id != null) 'id': id,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'title': title,
      'description': description,
      'category': category.toJson(),
      'quantityNeeded': quantityNeeded,
      'quantityFulfilled': quantityFulfilled,
      'rewardAmountCents': rewardAmountCents,
      'rewardType': rewardType.toJson(),
      if (tradeItemDescription != null)
        'tradeItemDescription': tradeItemDescription,
      'latitude': latitude,
      'longitude': longitude,
      'addressSnippet': addressSnippet,
      'radiusMiles': radiusMiles,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Bounty',
      if (id != null) 'id': id,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'title': title,
      'description': description,
      'category': category.toJson(),
      'quantityNeeded': quantityNeeded,
      'quantityFulfilled': quantityFulfilled,
      'rewardAmountCents': rewardAmountCents,
      'rewardType': rewardType.toJson(),
      if (tradeItemDescription != null)
        'tradeItemDescription': tradeItemDescription,
      'latitude': latitude,
      'longitude': longitude,
      'addressSnippet': addressSnippet,
      'radiusMiles': radiusMiles,
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

class _BountyImpl extends Bounty {
  _BountyImpl({
    int? id,
    required int creatorId,
    required String creatorName,
    required String title,
    required String description,
    required _iljslhxv.MaterialCategory category,
    required int quantityNeeded,
    int? quantityFulfilled,
    required int rewardAmountCents,
    required _isy11kxj.RewardType rewardType,
    String? tradeItemDescription,
    required double latitude,
    required double longitude,
    required String addressSnippet,
    double? radiusMiles,
    String? status,
    DateTime? createdAt,
  }) : super._(
         id: id,
         creatorId: creatorId,
         creatorName: creatorName,
         title: title,
         description: description,
         category: category,
         quantityNeeded: quantityNeeded,
         quantityFulfilled: quantityFulfilled,
         rewardAmountCents: rewardAmountCents,
         rewardType: rewardType,
         tradeItemDescription: tradeItemDescription,
         latitude: latitude,
         longitude: longitude,
         addressSnippet: addressSnippet,
         radiusMiles: radiusMiles,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Bounty]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Bounty copyWith({
    Object? id = _Undefined,
    int? creatorId,
    String? creatorName,
    String? title,
    String? description,
    _iljslhxv.MaterialCategory? category,
    int? quantityNeeded,
    int? quantityFulfilled,
    int? rewardAmountCents,
    _isy11kxj.RewardType? rewardType,
    Object? tradeItemDescription = _Undefined,
    double? latitude,
    double? longitude,
    String? addressSnippet,
    double? radiusMiles,
    String? status,
    DateTime? createdAt,
  }) {
    return Bounty(
      id: id is int? ? id : this.id,
      creatorId: creatorId ?? this.creatorId,
      creatorName: creatorName ?? this.creatorName,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      quantityNeeded: quantityNeeded ?? this.quantityNeeded,
      quantityFulfilled: quantityFulfilled ?? this.quantityFulfilled,
      rewardAmountCents: rewardAmountCents ?? this.rewardAmountCents,
      rewardType: rewardType ?? this.rewardType,
      tradeItemDescription: tradeItemDescription is String?
          ? tradeItemDescription
          : this.tradeItemDescription,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addressSnippet: addressSnippet ?? this.addressSnippet,
      radiusMiles: radiusMiles ?? this.radiusMiles,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
