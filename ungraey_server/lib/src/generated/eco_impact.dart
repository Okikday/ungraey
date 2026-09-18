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

abstract class EcoImpact
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = EcoImpactTable();

  static const db = EcoImpactRepository._();

  @override
  int? id;

  int userId;

  double totalKgDiverted;

  double totalCo2eSavedKg;

  double treesSavedEquivalent;

  double waterSavedLiters;

  int pointsBalance;

  int completedHandoffsCount;

  DateTime updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [EcoImpact]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static EcoImpactInclude include() {
    return EcoImpactInclude._();
  }

  static EcoImpactIncludeList includeList({
    _is.WhereExpressionBuilder<EcoImpactTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EcoImpactTable>? orderBy,
    _is.OrderByListBuilder<EcoImpactTable>? orderByList,
    EcoImpactInclude? include,
  }) {
    return EcoImpactIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EcoImpact.t),
      orderByList: orderByList?.call(EcoImpact.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class EcoImpactUpdateTable extends _is.UpdateTable<EcoImpactTable> {
  EcoImpactUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<double, double> totalKgDiverted(double value) =>
      _is.ColumnValue(
        table.totalKgDiverted,
        value,
      );

  _is.ColumnValue<double, double> totalCo2eSavedKg(double value) =>
      _is.ColumnValue(
        table.totalCo2eSavedKg,
        value,
      );

  _is.ColumnValue<double, double> treesSavedEquivalent(double value) =>
      _is.ColumnValue(
        table.treesSavedEquivalent,
        value,
      );

  _is.ColumnValue<double, double> waterSavedLiters(double value) =>
      _is.ColumnValue(
        table.waterSavedLiters,
        value,
      );

  _is.ColumnValue<int, int> pointsBalance(int value) => _is.ColumnValue(
    table.pointsBalance,
    value,
  );

  _is.ColumnValue<int, int> completedHandoffsCount(int value) =>
      _is.ColumnValue(
        table.completedHandoffsCount,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class EcoImpactTable extends _is.Table<int?> {
  EcoImpactTable({super.tableRelation}) : super(tableName: 'eco_impact') {
    updateTable = EcoImpactUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    totalKgDiverted = _is.ColumnDouble(
      'totalKgDiverted',
      this,
      hasDefault: true,
    );
    totalCo2eSavedKg = _is.ColumnDouble(
      'totalCo2eSavedKg',
      this,
      hasDefault: true,
    );
    treesSavedEquivalent = _is.ColumnDouble(
      'treesSavedEquivalent',
      this,
      hasDefault: true,
    );
    waterSavedLiters = _is.ColumnDouble(
      'waterSavedLiters',
      this,
      hasDefault: true,
    );
    pointsBalance = _is.ColumnInt(
      'pointsBalance',
      this,
      hasDefault: true,
    );
    completedHandoffsCount = _is.ColumnInt(
      'completedHandoffsCount',
      this,
      hasDefault: true,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final EcoImpactUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnDouble totalKgDiverted;

  late final _is.ColumnDouble totalCo2eSavedKg;

  late final _is.ColumnDouble treesSavedEquivalent;

  late final _is.ColumnDouble waterSavedLiters;

  late final _is.ColumnInt pointsBalance;

  late final _is.ColumnInt completedHandoffsCount;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    totalKgDiverted,
    totalCo2eSavedKg,
    treesSavedEquivalent,
    waterSavedLiters,
    pointsBalance,
    completedHandoffsCount,
    updatedAt,
  ];
}

class EcoImpactInclude extends _is.IncludeObject {
  EcoImpactInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => EcoImpact.t;
}

class EcoImpactIncludeList extends _is.IncludeList {
  EcoImpactIncludeList._({
    _is.WhereExpressionBuilder<EcoImpactTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EcoImpact.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => EcoImpact.t;
}

class EcoImpactRepository {
  const EcoImpactRepository._();

  /// Returns a list of [EcoImpact]s matching the given query parameters.
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
  Future<List<EcoImpact>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EcoImpactTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EcoImpactTable>? orderBy,
    _is.OrderByListBuilder<EcoImpactTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EcoImpact>(
      where: where?.call(EcoImpact.t),
      orderBy: orderBy?.call(EcoImpact.t),
      orderByList: orderByList?.call(EcoImpact.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [EcoImpact] matching the given query parameters.
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
  Future<EcoImpact?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EcoImpactTable>? where,
    int? offset,
    _is.OrderByBuilder<EcoImpactTable>? orderBy,
    _is.OrderByListBuilder<EcoImpactTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EcoImpact>(
      where: where?.call(EcoImpact.t),
      orderBy: orderBy?.call(EcoImpact.t),
      orderByList: orderByList?.call(EcoImpact.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EcoImpact] by its [id] or null if no such row exists.
  Future<EcoImpact?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<EcoImpact>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [EcoImpact]s in the list and returns the inserted rows.
  ///
  /// The returned [EcoImpact]s will have their `id` fields set.
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
  Future<List<EcoImpact>> insert(
    _is.DatabaseSession session,
    List<EcoImpact> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<EcoImpact>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [EcoImpact] and returns the inserted row.
  ///
  /// The returned [EcoImpact] will have its `id` field set.
  Future<EcoImpact> insertRow(
    _is.DatabaseSession session,
    EcoImpact row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<EcoImpact>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [EcoImpact]s in the list and returns the resulting rows.
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
  /// The returned [EcoImpact]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EcoImpact>> upsert(
    _is.DatabaseSession session,
    List<EcoImpact> rows, {
    required _is.ColumnSelections<EcoImpactTable> conflictColumns,
    _is.ColumnSelections<EcoImpactTable>? updateColumns,
    _is.WhereExpressionBuilder<EcoImpactTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<EcoImpact>(
      rows,
      conflictColumns: conflictColumns(EcoImpact.t),
      updateColumns: updateColumns?.call(EcoImpact.t),
      updateWhere: updateWhere?.call(EcoImpact.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [EcoImpact] and returns the resulting row.
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
  /// The returned [EcoImpact] will have its `id` field set.
  Future<EcoImpact?> upsertRow(
    _is.DatabaseSession session,
    EcoImpact row, {
    required _is.ColumnSelections<EcoImpactTable> conflictColumns,
    _is.ColumnSelections<EcoImpactTable>? updateColumns,
    _is.WhereExpressionBuilder<EcoImpactTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<EcoImpact>(
      row,
      conflictColumns: conflictColumns(EcoImpact.t),
      updateColumns: updateColumns?.call(EcoImpact.t),
      updateWhere: updateWhere?.call(EcoImpact.t),
      transaction: transaction,
    );
  }

  /// Updates all [EcoImpact]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EcoImpact>> update(
    _is.DatabaseSession session,
    List<EcoImpact> rows, {
    _is.ColumnSelections<EcoImpactTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<EcoImpact>(
      rows,
      columns: columns?.call(EcoImpact.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [EcoImpact]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EcoImpact> updateRow(
    _is.DatabaseSession session,
    EcoImpact row, {
    _is.ColumnSelections<EcoImpactTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<EcoImpact>(
      row,
      columns: columns?.call(EcoImpact.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EcoImpact] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EcoImpact?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<EcoImpactUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<EcoImpact>(
      id,
      columnValues: columnValues(EcoImpact.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EcoImpact]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EcoImpact>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<EcoImpactUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<EcoImpactTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EcoImpactTable>? orderBy,
    _is.OrderByListBuilder<EcoImpactTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<EcoImpact>(
      columnValues: columnValues(EcoImpact.t.updateTable),
      where: where(EcoImpact.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EcoImpact.t),
      orderByList: orderByList?.call(EcoImpact.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [EcoImpact]s in the list and returns the deleted rows.
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
  Future<List<EcoImpact>> delete(
    _is.DatabaseSession session,
    List<EcoImpact> rows, {
    _is.OrderByBuilder<EcoImpactTable>? orderBy,
    _is.OrderByListBuilder<EcoImpactTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<EcoImpact>(
      rows,
      orderBy: orderBy?.call(EcoImpact.t),
      orderByList: orderByList?.call(EcoImpact.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [EcoImpact].
  Future<EcoImpact> deleteRow(
    _is.DatabaseSession session,
    EcoImpact row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EcoImpact>(
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
  Future<List<EcoImpact>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EcoImpactTable> where,
    _is.OrderByBuilder<EcoImpactTable>? orderBy,
    _is.OrderByListBuilder<EcoImpactTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<EcoImpact>(
      where: where(EcoImpact.t),
      orderBy: orderBy?.call(EcoImpact.t),
      orderByList: orderByList?.call(EcoImpact.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EcoImpactTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<EcoImpact>(
      where: where?.call(EcoImpact.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EcoImpact] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EcoImpactTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EcoImpact>(
      where: where(EcoImpact.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
