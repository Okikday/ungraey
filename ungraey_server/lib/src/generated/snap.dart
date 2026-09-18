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

abstract class Snap implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      detectedCategories: _it738mhb.Protocol()
          .deserialize<List<_iljslhxv.MaterialCategory>>(
            jsonSerialization['detectedCategories'],
          ),
      detectedLabels: _it738mhb.Protocol().deserialize<List<String>>(
        jsonSerialization['detectedLabels'],
      ),
      estimatedWeightKg: (jsonSerialization['estimatedWeightKg'] as num)
          .toDouble(),
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      status: jsonSerialization['status'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = SnapTable();

  static const db = SnapRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Snap]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static SnapInclude include() {
    return SnapInclude._();
  }

  static SnapIncludeList includeList({
    _is.WhereExpressionBuilder<SnapTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SnapTable>? orderBy,
    _is.OrderByListBuilder<SnapTable>? orderByList,
    SnapInclude? include,
  }) {
    return SnapIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Snap.t),
      orderByList: orderByList?.call(Snap.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class SnapUpdateTable extends _is.UpdateTable<SnapTable> {
  SnapUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<String, String> imageUrl(String value) => _is.ColumnValue(
    table.imageUrl,
    value,
  );

  _is.ColumnValue<
    List<_iljslhxv.MaterialCategory>,
    List<_iljslhxv.MaterialCategory>
  >
  detectedCategories(List<_iljslhxv.MaterialCategory> value) => _is.ColumnValue(
    table.detectedCategories,
    value,
  );

  _is.ColumnValue<List<String>, List<String>> detectedLabels(
    List<String> value,
  ) => _is.ColumnValue(
    table.detectedLabels,
    value,
  );

  _is.ColumnValue<double, double> estimatedWeightKg(double value) =>
      _is.ColumnValue(
        table.estimatedWeightKg,
        value,
      );

  _is.ColumnValue<double, double> latitude(double value) => _is.ColumnValue(
    table.latitude,
    value,
  );

  _is.ColumnValue<double, double> longitude(double value) => _is.ColumnValue(
    table.longitude,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class SnapTable extends _is.Table<int?> {
  SnapTable({super.tableRelation}) : super(tableName: 'snap') {
    updateTable = SnapUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    imageUrl = _is.ColumnString(
      'imageUrl',
      this,
    );
    detectedCategories =
        _is.ColumnSerializable<List<_iljslhxv.MaterialCategory>>(
          'detectedCategories',
          this,
        );
    detectedLabels = _is.ColumnSerializable<List<String>>(
      'detectedLabels',
      this,
    );
    estimatedWeightKg = _is.ColumnDouble(
      'estimatedWeightKg',
      this,
    );
    latitude = _is.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _is.ColumnDouble(
      'longitude',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final SnapUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnString imageUrl;

  late final _is.ColumnSerializable<List<_iljslhxv.MaterialCategory>>
  detectedCategories;

  late final _is.ColumnSerializable<List<String>> detectedLabels;

  late final _is.ColumnDouble estimatedWeightKg;

  late final _is.ColumnDouble latitude;

  late final _is.ColumnDouble longitude;

  late final _is.ColumnString status;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    imageUrl,
    detectedCategories,
    detectedLabels,
    estimatedWeightKg,
    latitude,
    longitude,
    status,
    createdAt,
  ];
}

class SnapInclude extends _is.IncludeObject {
  SnapInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Snap.t;
}

class SnapIncludeList extends _is.IncludeList {
  SnapIncludeList._({
    _is.WhereExpressionBuilder<SnapTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Snap.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Snap.t;
}

class SnapRepository {
  const SnapRepository._();

  /// Returns a list of [Snap]s matching the given query parameters.
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
  Future<List<Snap>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SnapTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SnapTable>? orderBy,
    _is.OrderByListBuilder<SnapTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Snap>(
      where: where?.call(Snap.t),
      orderBy: orderBy?.call(Snap.t),
      orderByList: orderByList?.call(Snap.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Snap] matching the given query parameters.
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
  Future<Snap?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SnapTable>? where,
    int? offset,
    _is.OrderByBuilder<SnapTable>? orderBy,
    _is.OrderByListBuilder<SnapTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Snap>(
      where: where?.call(Snap.t),
      orderBy: orderBy?.call(Snap.t),
      orderByList: orderByList?.call(Snap.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Snap] by its [id] or null if no such row exists.
  Future<Snap?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Snap>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Snap]s in the list and returns the inserted rows.
  ///
  /// The returned [Snap]s will have their `id` fields set.
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
  Future<List<Snap>> insert(
    _is.DatabaseSession session,
    List<Snap> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Snap>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Snap] and returns the inserted row.
  ///
  /// The returned [Snap] will have its `id` field set.
  Future<Snap> insertRow(
    _is.DatabaseSession session,
    Snap row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Snap>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Snap]s in the list and returns the resulting rows.
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
  /// The returned [Snap]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Snap>> upsert(
    _is.DatabaseSession session,
    List<Snap> rows, {
    required _is.ColumnSelections<SnapTable> conflictColumns,
    _is.ColumnSelections<SnapTable>? updateColumns,
    _is.WhereExpressionBuilder<SnapTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Snap>(
      rows,
      conflictColumns: conflictColumns(Snap.t),
      updateColumns: updateColumns?.call(Snap.t),
      updateWhere: updateWhere?.call(Snap.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Snap] and returns the resulting row.
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
  /// The returned [Snap] will have its `id` field set.
  Future<Snap?> upsertRow(
    _is.DatabaseSession session,
    Snap row, {
    required _is.ColumnSelections<SnapTable> conflictColumns,
    _is.ColumnSelections<SnapTable>? updateColumns,
    _is.WhereExpressionBuilder<SnapTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Snap>(
      row,
      conflictColumns: conflictColumns(Snap.t),
      updateColumns: updateColumns?.call(Snap.t),
      updateWhere: updateWhere?.call(Snap.t),
      transaction: transaction,
    );
  }

  /// Updates all [Snap]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Snap>> update(
    _is.DatabaseSession session,
    List<Snap> rows, {
    _is.ColumnSelections<SnapTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Snap>(
      rows,
      columns: columns?.call(Snap.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Snap]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Snap> updateRow(
    _is.DatabaseSession session,
    Snap row, {
    _is.ColumnSelections<SnapTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Snap>(
      row,
      columns: columns?.call(Snap.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Snap] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Snap?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<SnapUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Snap>(
      id,
      columnValues: columnValues(Snap.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Snap]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Snap>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SnapUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SnapTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SnapTable>? orderBy,
    _is.OrderByListBuilder<SnapTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Snap>(
      columnValues: columnValues(Snap.t.updateTable),
      where: where(Snap.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Snap.t),
      orderByList: orderByList?.call(Snap.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Snap]s in the list and returns the deleted rows.
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
  Future<List<Snap>> delete(
    _is.DatabaseSession session,
    List<Snap> rows, {
    _is.OrderByBuilder<SnapTable>? orderBy,
    _is.OrderByListBuilder<SnapTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Snap>(
      rows,
      orderBy: orderBy?.call(Snap.t),
      orderByList: orderByList?.call(Snap.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Snap].
  Future<Snap> deleteRow(
    _is.DatabaseSession session,
    Snap row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Snap>(
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
  Future<List<Snap>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SnapTable> where,
    _is.OrderByBuilder<SnapTable>? orderBy,
    _is.OrderByListBuilder<SnapTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Snap>(
      where: where(Snap.t),
      orderBy: orderBy?.call(Snap.t),
      orderByList: orderByList?.call(Snap.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SnapTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Snap>(
      where: where?.call(Snap.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Snap] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SnapTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Snap>(
      where: where(Snap.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
