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
import 'reward_type.dart' as _isy11kxj;

abstract class HandoffTransaction
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = HandoffTransactionTable();

  static const db = HandoffTransactionRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [HandoffTransaction]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static HandoffTransactionInclude include() {
    return HandoffTransactionInclude._();
  }

  static HandoffTransactionIncludeList includeList({
    _is.WhereExpressionBuilder<HandoffTransactionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HandoffTransactionTable>? orderBy,
    _is.OrderByListBuilder<HandoffTransactionTable>? orderByList,
    HandoffTransactionInclude? include,
  }) {
    return HandoffTransactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HandoffTransaction.t),
      orderByList: orderByList?.call(HandoffTransaction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class HandoffTransactionUpdateTable
    extends _is.UpdateTable<HandoffTransactionTable> {
  HandoffTransactionUpdateTable(super.table);

  _is.ColumnValue<int, int> snapId(int value) => _is.ColumnValue(
    table.snapId,
    value,
  );

  _is.ColumnValue<int, int> bountyId(int value) => _is.ColumnValue(
    table.bountyId,
    value,
  );

  _is.ColumnValue<int, int> sellerId(int value) => _is.ColumnValue(
    table.sellerId,
    value,
  );

  _is.ColumnValue<int, int> buyerId(int value) => _is.ColumnValue(
    table.buyerId,
    value,
  );

  _is.ColumnValue<String, String> qrToken(String value) => _is.ColumnValue(
    table.qrToken,
    value,
  );

  _is.ColumnValue<int, int> rewardAmountCents(int value) => _is.ColumnValue(
    table.rewardAmountCents,
    value,
  );

  _is.ColumnValue<_isy11kxj.RewardType, _isy11kxj.RewardType> rewardType(
    _isy11kxj.RewardType value,
  ) => _is.ColumnValue(
    table.rewardType,
    value,
  );

  _is.ColumnValue<double, double> kgDiverted(double value) => _is.ColumnValue(
    table.kgDiverted,
    value,
  );

  _is.ColumnValue<double, double> co2eSavedKg(double value) => _is.ColumnValue(
    table.co2eSavedKg,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _is.ColumnValue(
        table.completedAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class HandoffTransactionTable extends _is.Table<int?> {
  HandoffTransactionTable({super.tableRelation})
    : super(tableName: 'handoff_transaction') {
    updateTable = HandoffTransactionUpdateTable(this);
    snapId = _is.ColumnInt(
      'snapId',
      this,
    );
    bountyId = _is.ColumnInt(
      'bountyId',
      this,
    );
    sellerId = _is.ColumnInt(
      'sellerId',
      this,
    );
    buyerId = _is.ColumnInt(
      'buyerId',
      this,
    );
    qrToken = _is.ColumnString(
      'qrToken',
      this,
    );
    rewardAmountCents = _is.ColumnInt(
      'rewardAmountCents',
      this,
    );
    rewardType = _is.ColumnEnum(
      'rewardType',
      this,
      _is.EnumSerialization.byName,
    );
    kgDiverted = _is.ColumnDouble(
      'kgDiverted',
      this,
    );
    co2eSavedKg = _is.ColumnDouble(
      'co2eSavedKg',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    completedAt = _is.ColumnDateTime(
      'completedAt',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final HandoffTransactionUpdateTable updateTable;

  late final _is.ColumnInt snapId;

  late final _is.ColumnInt bountyId;

  late final _is.ColumnInt sellerId;

  late final _is.ColumnInt buyerId;

  late final _is.ColumnString qrToken;

  late final _is.ColumnInt rewardAmountCents;

  late final _is.ColumnEnum<_isy11kxj.RewardType> rewardType;

  late final _is.ColumnDouble kgDiverted;

  late final _is.ColumnDouble co2eSavedKg;

  late final _is.ColumnString status;

  late final _is.ColumnDateTime completedAt;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    snapId,
    bountyId,
    sellerId,
    buyerId,
    qrToken,
    rewardAmountCents,
    rewardType,
    kgDiverted,
    co2eSavedKg,
    status,
    completedAt,
    createdAt,
  ];
}

class HandoffTransactionInclude extends _is.IncludeObject {
  HandoffTransactionInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => HandoffTransaction.t;
}

class HandoffTransactionIncludeList extends _is.IncludeList {
  HandoffTransactionIncludeList._({
    _is.WhereExpressionBuilder<HandoffTransactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(HandoffTransaction.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => HandoffTransaction.t;
}

class HandoffTransactionRepository {
  const HandoffTransactionRepository._();

  /// Returns a list of [HandoffTransaction]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<HandoffTransaction>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HandoffTransactionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HandoffTransactionTable>? orderBy,
    _is.OrderByListBuilder<HandoffTransactionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<HandoffTransaction>(
      where: where?.call(HandoffTransaction.t),
      orderBy: orderBy?.call(HandoffTransaction.t),
      orderByList: orderByList?.call(HandoffTransaction.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [HandoffTransaction] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<HandoffTransaction?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HandoffTransactionTable>? where,
    int? offset,
    _is.OrderByBuilder<HandoffTransactionTable>? orderBy,
    _is.OrderByListBuilder<HandoffTransactionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<HandoffTransaction>(
      where: where?.call(HandoffTransaction.t),
      orderBy: orderBy?.call(HandoffTransaction.t),
      orderByList: orderByList?.call(HandoffTransaction.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [HandoffTransaction] by its [id] or null if no such row exists.
  Future<HandoffTransaction?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<HandoffTransaction>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [HandoffTransaction]s in the list and returns the inserted rows.
  ///
  /// The returned [HandoffTransaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HandoffTransaction>> insert(
    _is.DatabaseSession session,
    List<HandoffTransaction> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<HandoffTransaction>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [HandoffTransaction] and returns the inserted row.
  ///
  /// The returned [HandoffTransaction] will have its `id` field set.
  Future<HandoffTransaction> insertRow(
    _is.DatabaseSession session,
    HandoffTransaction row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<HandoffTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [HandoffTransaction]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [HandoffTransaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HandoffTransaction>> upsert(
    _is.DatabaseSession session,
    List<HandoffTransaction> rows, {
    required _is.ColumnSelections<HandoffTransactionTable> conflictColumns,
    _is.ColumnSelections<HandoffTransactionTable>? updateColumns,
    _is.WhereExpressionBuilder<HandoffTransactionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<HandoffTransaction>(
      rows,
      conflictColumns: conflictColumns(HandoffTransaction.t),
      updateColumns: updateColumns?.call(HandoffTransaction.t),
      updateWhere: updateWhere?.call(HandoffTransaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [HandoffTransaction] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [HandoffTransaction] will have its `id` field set.
  Future<HandoffTransaction?> upsertRow(
    _is.DatabaseSession session,
    HandoffTransaction row, {
    required _is.ColumnSelections<HandoffTransactionTable> conflictColumns,
    _is.ColumnSelections<HandoffTransactionTable>? updateColumns,
    _is.WhereExpressionBuilder<HandoffTransactionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<HandoffTransaction>(
      row,
      conflictColumns: conflictColumns(HandoffTransaction.t),
      updateColumns: updateColumns?.call(HandoffTransaction.t),
      updateWhere: updateWhere?.call(HandoffTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates all [HandoffTransaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HandoffTransaction>> update(
    _is.DatabaseSession session,
    List<HandoffTransaction> rows, {
    _is.ColumnSelections<HandoffTransactionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<HandoffTransaction>(
      rows,
      columns: columns?.call(HandoffTransaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [HandoffTransaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<HandoffTransaction> updateRow(
    _is.DatabaseSession session,
    HandoffTransaction row, {
    _is.ColumnSelections<HandoffTransactionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<HandoffTransaction>(
      row,
      columns: columns?.call(HandoffTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [HandoffTransaction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<HandoffTransaction?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<HandoffTransactionUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<HandoffTransaction>(
      id,
      columnValues: columnValues(HandoffTransaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [HandoffTransaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HandoffTransaction>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<HandoffTransactionUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<HandoffTransactionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HandoffTransactionTable>? orderBy,
    _is.OrderByListBuilder<HandoffTransactionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<HandoffTransaction>(
      columnValues: columnValues(HandoffTransaction.t.updateTable),
      where: where(HandoffTransaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HandoffTransaction.t),
      orderByList: orderByList?.call(HandoffTransaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [HandoffTransaction]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HandoffTransaction>> delete(
    _is.DatabaseSession session,
    List<HandoffTransaction> rows, {
    _is.OrderByBuilder<HandoffTransactionTable>? orderBy,
    _is.OrderByListBuilder<HandoffTransactionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<HandoffTransaction>(
      rows,
      orderBy: orderBy?.call(HandoffTransaction.t),
      orderByList: orderByList?.call(HandoffTransaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [HandoffTransaction].
  Future<HandoffTransaction> deleteRow(
    _is.DatabaseSession session,
    HandoffTransaction row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<HandoffTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HandoffTransaction>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HandoffTransactionTable> where,
    _is.OrderByBuilder<HandoffTransactionTable>? orderBy,
    _is.OrderByListBuilder<HandoffTransactionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<HandoffTransaction>(
      where: where(HandoffTransaction.t),
      orderBy: orderBy?.call(HandoffTransaction.t),
      orderByList: orderByList?.call(HandoffTransaction.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HandoffTransactionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<HandoffTransaction>(
      where: where?.call(HandoffTransaction.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [HandoffTransaction] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HandoffTransactionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<HandoffTransaction>(
      where: where(HandoffTransaction.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
