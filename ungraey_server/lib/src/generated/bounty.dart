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
import 'material_category.dart' as _iljslhxv;
import 'reward_type.dart' as _isy11kxj;

abstract class Bounty implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = BountyTable();

  static const db = BountyRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Bounty]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static BountyInclude include() {
    return BountyInclude._();
  }

  static BountyIncludeList includeList({
    _is.WhereExpressionBuilder<BountyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BountyTable>? orderBy,
    _is.OrderByListBuilder<BountyTable>? orderByList,
    BountyInclude? include,
  }) {
    return BountyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bounty.t),
      orderByList: orderByList?.call(Bounty.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class BountyUpdateTable extends _is.UpdateTable<BountyTable> {
  BountyUpdateTable(super.table);

  _is.ColumnValue<int, int> creatorId(int value) => _is.ColumnValue(
    table.creatorId,
    value,
  );

  _is.ColumnValue<String, String> creatorName(String value) => _is.ColumnValue(
    table.creatorName,
    value,
  );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<_iljslhxv.MaterialCategory, _iljslhxv.MaterialCategory>
  category(_iljslhxv.MaterialCategory value) => _is.ColumnValue(
    table.category,
    value,
  );

  _is.ColumnValue<int, int> quantityNeeded(int value) => _is.ColumnValue(
    table.quantityNeeded,
    value,
  );

  _is.ColumnValue<int, int> quantityFulfilled(int value) => _is.ColumnValue(
    table.quantityFulfilled,
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

  _is.ColumnValue<String, String> tradeItemDescription(String? value) =>
      _is.ColumnValue(
        table.tradeItemDescription,
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

  _is.ColumnValue<String, String> addressSnippet(String value) =>
      _is.ColumnValue(
        table.addressSnippet,
        value,
      );

  _is.ColumnValue<double, double> radiusMiles(double value) => _is.ColumnValue(
    table.radiusMiles,
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

class BountyTable extends _is.Table<int?> {
  BountyTable({super.tableRelation}) : super(tableName: 'bounty') {
    updateTable = BountyUpdateTable(this);
    creatorId = _is.ColumnInt(
      'creatorId',
      this,
    );
    creatorName = _is.ColumnString(
      'creatorName',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    category = _is.ColumnEnum(
      'category',
      this,
      _is.EnumSerialization.byName,
    );
    quantityNeeded = _is.ColumnInt(
      'quantityNeeded',
      this,
    );
    quantityFulfilled = _is.ColumnInt(
      'quantityFulfilled',
      this,
      hasDefault: true,
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
    tradeItemDescription = _is.ColumnString(
      'tradeItemDescription',
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
    addressSnippet = _is.ColumnString(
      'addressSnippet',
      this,
    );
    radiusMiles = _is.ColumnDouble(
      'radiusMiles',
      this,
      hasDefault: true,
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

  late final BountyUpdateTable updateTable;

  late final _is.ColumnInt creatorId;

  late final _is.ColumnString creatorName;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnEnum<_iljslhxv.MaterialCategory> category;

  late final _is.ColumnInt quantityNeeded;

  late final _is.ColumnInt quantityFulfilled;

  late final _is.ColumnInt rewardAmountCents;

  late final _is.ColumnEnum<_isy11kxj.RewardType> rewardType;

  late final _is.ColumnString tradeItemDescription;

  late final _is.ColumnDouble latitude;

  late final _is.ColumnDouble longitude;

  late final _is.ColumnString addressSnippet;

  late final _is.ColumnDouble radiusMiles;

  late final _is.ColumnString status;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    creatorId,
    creatorName,
    title,
    description,
    category,
    quantityNeeded,
    quantityFulfilled,
    rewardAmountCents,
    rewardType,
    tradeItemDescription,
    latitude,
    longitude,
    addressSnippet,
    radiusMiles,
    status,
    createdAt,
  ];
}

class BountyInclude extends _is.IncludeObject {
  BountyInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Bounty.t;
}

class BountyIncludeList extends _is.IncludeList {
  BountyIncludeList._({
    _is.WhereExpressionBuilder<BountyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Bounty.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Bounty.t;
}

class BountyRepository {
  const BountyRepository._();

  /// Returns a list of [Bounty]s matching the given query parameters.
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
  Future<List<Bounty>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BountyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BountyTable>? orderBy,
    _is.OrderByListBuilder<BountyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Bounty>(
      where: where?.call(Bounty.t),
      orderBy: orderBy?.call(Bounty.t),
      orderByList: orderByList?.call(Bounty.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Bounty] matching the given query parameters.
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
  Future<Bounty?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BountyTable>? where,
    int? offset,
    _is.OrderByBuilder<BountyTable>? orderBy,
    _is.OrderByListBuilder<BountyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Bounty>(
      where: where?.call(Bounty.t),
      orderBy: orderBy?.call(Bounty.t),
      orderByList: orderByList?.call(Bounty.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Bounty] by its [id] or null if no such row exists.
  Future<Bounty?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Bounty>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Bounty]s in the list and returns the inserted rows.
  ///
  /// The returned [Bounty]s will have their `id` fields set.
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
  Future<List<Bounty>> insert(
    _is.DatabaseSession session,
    List<Bounty> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Bounty>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Bounty] and returns the inserted row.
  ///
  /// The returned [Bounty] will have its `id` field set.
  Future<Bounty> insertRow(
    _is.DatabaseSession session,
    Bounty row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Bounty>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Bounty]s in the list and returns the resulting rows.
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
  /// The returned [Bounty]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Bounty>> upsert(
    _is.DatabaseSession session,
    List<Bounty> rows, {
    required _is.ColumnSelections<BountyTable> conflictColumns,
    _is.ColumnSelections<BountyTable>? updateColumns,
    _is.WhereExpressionBuilder<BountyTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Bounty>(
      rows,
      conflictColumns: conflictColumns(Bounty.t),
      updateColumns: updateColumns?.call(Bounty.t),
      updateWhere: updateWhere?.call(Bounty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Bounty] and returns the resulting row.
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
  /// The returned [Bounty] will have its `id` field set.
  Future<Bounty?> upsertRow(
    _is.DatabaseSession session,
    Bounty row, {
    required _is.ColumnSelections<BountyTable> conflictColumns,
    _is.ColumnSelections<BountyTable>? updateColumns,
    _is.WhereExpressionBuilder<BountyTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Bounty>(
      row,
      conflictColumns: conflictColumns(Bounty.t),
      updateColumns: updateColumns?.call(Bounty.t),
      updateWhere: updateWhere?.call(Bounty.t),
      transaction: transaction,
    );
  }

  /// Updates all [Bounty]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Bounty>> update(
    _is.DatabaseSession session,
    List<Bounty> rows, {
    _is.ColumnSelections<BountyTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Bounty>(
      rows,
      columns: columns?.call(Bounty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Bounty]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Bounty> updateRow(
    _is.DatabaseSession session,
    Bounty row, {
    _is.ColumnSelections<BountyTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Bounty>(
      row,
      columns: columns?.call(Bounty.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Bounty] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Bounty?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BountyUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Bounty>(
      id,
      columnValues: columnValues(Bounty.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Bounty]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Bounty>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BountyUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BountyTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BountyTable>? orderBy,
    _is.OrderByListBuilder<BountyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Bounty>(
      columnValues: columnValues(Bounty.t.updateTable),
      where: where(Bounty.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bounty.t),
      orderByList: orderByList?.call(Bounty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Bounty]s in the list and returns the deleted rows.
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
  Future<List<Bounty>> delete(
    _is.DatabaseSession session,
    List<Bounty> rows, {
    _is.OrderByBuilder<BountyTable>? orderBy,
    _is.OrderByListBuilder<BountyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Bounty>(
      rows,
      orderBy: orderBy?.call(Bounty.t),
      orderByList: orderByList?.call(Bounty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Bounty].
  Future<Bounty> deleteRow(
    _is.DatabaseSession session,
    Bounty row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Bounty>(
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
  Future<List<Bounty>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BountyTable> where,
    _is.OrderByBuilder<BountyTable>? orderBy,
    _is.OrderByListBuilder<BountyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Bounty>(
      where: where(Bounty.t),
      orderBy: orderBy?.call(Bounty.t),
      orderByList: orderByList?.call(Bounty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BountyTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Bounty>(
      where: where?.call(Bounty.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Bounty] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BountyTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Bounty>(
      where: where(Bounty.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
