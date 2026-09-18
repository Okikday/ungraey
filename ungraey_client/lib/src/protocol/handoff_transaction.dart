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
import 'reward_type.dart' as _isy11kxj;

abstract class HandoffTransaction
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  HandoffTransaction._({
    this.id,
    required this.snapId,
    required this.bountyId,
    required this.sellerId,
    required this.buyerId,
    required this.qrToken,
    required this.rewardAmountCents,
    required this.rewardType,
    required this.kgDiverted,
    required this.co2eSavedKg,
    String? status,
    this.completedAt,
    DateTime? createdAt,
  }) : status = status ?? 'pending',
       createdAt = createdAt ?? DateTime.now();

  factory HandoffTransaction({
    int? id,
    required int snapId,
    required int bountyId,
    required int sellerId,
    required int buyerId,
    required String qrToken,
    required int rewardAmountCents,
    required _isy11kxj.RewardType rewardType,
    required double kgDiverted,
    required double co2eSavedKg,
    String? status,
    DateTime? completedAt,
    DateTime? createdAt,
  }) = _HandoffTransactionImpl;

  factory HandoffTransaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return HandoffTransaction(
      id: jsonSerialization['id'] as int?,
      snapId: jsonSerialization['snapId'] as int,
      bountyId: jsonSerialization['bountyId'] as int,
      sellerId: jsonSerialization['sellerId'] as int,
      buyerId: jsonSerialization['buyerId'] as int,
      qrToken: jsonSerialization['qrToken'] as String,
      rewardAmountCents: jsonSerialization['rewardAmountCents'] as int,
      rewardType: _isy11kxj.RewardType.fromJson(
        (jsonSerialization['rewardType'] as String),
      ),
      kgDiverted: (jsonSerialization['kgDiverted'] as num).toDouble(),
      co2eSavedKg: (jsonSerialization['co2eSavedKg'] as num).toDouble(),
      status: jsonSerialization['status'] as String?,
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int snapId;

  int bountyId;

  int sellerId;

  int buyerId;

  String qrToken;

  int rewardAmountCents;

  _isy11kxj.RewardType rewardType;

  double kgDiverted;

  double co2eSavedKg;

  String status;

  DateTime? completedAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [HandoffTransaction]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  HandoffTransaction copyWith({
    int? id,
    int? snapId,
    int? bountyId,
    int? sellerId,
    int? buyerId,
    String? qrToken,
    int? rewardAmountCents,
    _isy11kxj.RewardType? rewardType,
    double? kgDiverted,
    double? co2eSavedKg,
    String? status,
    DateTime? completedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HandoffTransaction',
      if (id != null) 'id': id,
      'snapId': snapId,
      'bountyId': bountyId,
      'sellerId': sellerId,
      'buyerId': buyerId,
      'qrToken': qrToken,
      'rewardAmountCents': rewardAmountCents,
      'rewardType': rewardType.toJson(),
      'kgDiverted': kgDiverted,
      'co2eSavedKg': co2eSavedKg,
      'status': status,
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HandoffTransaction',
      if (id != null) 'id': id,
      'snapId': snapId,
      'bountyId': bountyId,
      'sellerId': sellerId,
      'buyerId': buyerId,
      'qrToken': qrToken,
      'rewardAmountCents': rewardAmountCents,
      'rewardType': rewardType.toJson(),
      'kgDiverted': kgDiverted,
      'co2eSavedKg': co2eSavedKg,
      'status': status,
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HandoffTransactionImpl extends HandoffTransaction {
  _HandoffTransactionImpl({
    int? id,
    required int snapId,
    required int bountyId,
    required int sellerId,
    required int buyerId,
    required String qrToken,
    required int rewardAmountCents,
    required _isy11kxj.RewardType rewardType,
    required double kgDiverted,
    required double co2eSavedKg,
    String? status,
    DateTime? completedAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         snapId: snapId,
         bountyId: bountyId,
         sellerId: sellerId,
         buyerId: buyerId,
         qrToken: qrToken,
         rewardAmountCents: rewardAmountCents,
         rewardType: rewardType,
         kgDiverted: kgDiverted,
         co2eSavedKg: co2eSavedKg,
         status: status,
         completedAt: completedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [HandoffTransaction]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  HandoffTransaction copyWith({
    Object? id = _Undefined,
    int? snapId,
    int? bountyId,
    int? sellerId,
    int? buyerId,
    String? qrToken,
    int? rewardAmountCents,
    _isy11kxj.RewardType? rewardType,
    double? kgDiverted,
    double? co2eSavedKg,
    String? status,
    Object? completedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return HandoffTransaction(
      id: id is int? ? id : this.id,
      snapId: snapId ?? this.snapId,
      bountyId: bountyId ?? this.bountyId,
      sellerId: sellerId ?? this.sellerId,
      buyerId: buyerId ?? this.buyerId,
      qrToken: qrToken ?? this.qrToken,
      rewardAmountCents: rewardAmountCents ?? this.rewardAmountCents,
      rewardType: rewardType ?? this.rewardType,
      kgDiverted: kgDiverted ?? this.kgDiverted,
      co2eSavedKg: co2eSavedKg ?? this.co2eSavedKg,
      status: status ?? this.status,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
