/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i1n3uhu0;
import 'package:ungraey_server/src/generated/bounty.dart' as _iymn45h4;
import 'bounty.dart' as _iiyby75a;
import 'eco_impact.dart' as _i81kb3qt;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'handoff_transaction.dart' as _iwb66hkj;
import 'material_analysis_result.dart' as _ij1pbnut;
import 'material_category.dart' as _iljslhxv;
import 'reward_type.dart' as _isy11kxj;
import 'snap.dart' as _id9obscz;
export 'bounty.dart';
export 'eco_impact.dart';
export 'greetings/greeting.dart';
export 'handoff_transaction.dart';
export 'material_analysis_result.dart';
export 'material_category.dart';
export 'reward_type.dart';
export 'snap.dart';

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'bounty',
      dartName: 'Bounty',
      schema: 'public',
      module: 'ungraey',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'creatorId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'creatorName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MaterialCategory',
        ),
        _isp.ColumnDefinition(
          name: 'quantityNeeded',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'quantityFulfilled',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'rewardAmountCents',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'rewardType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RewardType',
        ),
        _isp.ColumnDefinition(
          name: 'tradeItemDescription',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'latitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'longitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'addressSnippet',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'radiusMiles',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '5.0',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'active\'',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'eco_impact',
      dartName: 'EcoImpact',
      schema: 'public',
      module: 'ungraey',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'totalKgDiverted',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
        _isp.ColumnDefinition(
          name: 'totalCo2eSavedKg',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
        _isp.ColumnDefinition(
          name: 'treesSavedEquivalent',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
        _isp.ColumnDefinition(
          name: 'waterSavedLiters',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
        _isp.ColumnDefinition(
          name: 'pointsBalance',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'completedHandoffsCount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'handoff_transaction',
      dartName: 'HandoffTransaction',
      schema: 'public',
      module: 'ungraey',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'snapId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'bountyId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'sellerId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'buyerId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'qrToken',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'rewardAmountCents',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'rewardType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RewardType',
        ),
        _isp.ColumnDefinition(
          name: 'kgDiverted',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'co2eSavedKg',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'pending\'',
        ),
        _isp.ColumnDefinition(
          name: 'completedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'snap',
      dartName: 'Snap',
      schema: 'public',
      module: 'ungraey',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'imageUrl',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'detectedCategories',
          columnType: _isp.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:MaterialCategory>',
        ),
        _isp.ColumnDefinition(
          name: 'detectedLabels',
          columnType: _isp.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _isp.ColumnDefinition(
          name: 'estimatedWeightKg',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'latitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'longitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'available\'',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    ..._i1n3uhu0.Protocol.targetTableDefinitions,
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _is.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _iiyby75a.Bounty) {
      return _iiyby75a.Bounty.fromJson(data) as T;
    }
    if (t == _i81kb3qt.EcoImpact) {
      return _i81kb3qt.EcoImpact.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _iwb66hkj.HandoffTransaction) {
      return _iwb66hkj.HandoffTransaction.fromJson(data) as T;
    }
    if (t == _ij1pbnut.MaterialAnalysisResult) {
      return _ij1pbnut.MaterialAnalysisResult.fromJson(data) as T;
    }
    if (t == _iljslhxv.MaterialCategory) {
      return _iljslhxv.MaterialCategory.fromJson(data) as T;
    }
    if (t == _isy11kxj.RewardType) {
      return _isy11kxj.RewardType.fromJson(data) as T;
    }
    if (t == _id9obscz.Snap) {
      return _id9obscz.Snap.fromJson(data) as T;
    }
    if (t == _is.getType<_iiyby75a.Bounty?>()) {
      return (data != null ? _iiyby75a.Bounty.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i81kb3qt.EcoImpact?>()) {
      return (data != null ? _i81kb3qt.EcoImpact.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iwb66hkj.HandoffTransaction?>()) {
      return (data != null ? _iwb66hkj.HandoffTransaction.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ij1pbnut.MaterialAnalysisResult?>()) {
      return (data != null
              ? _ij1pbnut.MaterialAnalysisResult.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_iljslhxv.MaterialCategory?>()) {
      return (data != null ? _iljslhxv.MaterialCategory.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_isy11kxj.RewardType?>()) {
      return (data != null ? _isy11kxj.RewardType.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_id9obscz.Snap?>()) {
      return (data != null ? _id9obscz.Snap.fromJson(data) : null) as T;
    }
    if (t == List<_iljslhxv.MaterialCategory>) {
      return (data as List)
              .map((e) => deserialize<_iljslhxv.MaterialCategory>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_iymn45h4.Bounty>) {
      return (data as List)
              .map((e) => deserialize<_iymn45h4.Bounty>(e))
              .toList()
          as T;
    }
    try {
      return _i1n3uhu0.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _iiyby75a.Bounty => 'Bounty',
      _i81kb3qt.EcoImpact => 'EcoImpact',
      _izw8z7ou.Greeting => 'Greeting',
      _iwb66hkj.HandoffTransaction => 'HandoffTransaction',
      _ij1pbnut.MaterialAnalysisResult => 'MaterialAnalysisResult',
      _iljslhxv.MaterialCategory => 'MaterialCategory',
      _isy11kxj.RewardType => 'RewardType',
      _id9obscz.Snap => 'Snap',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('ungraey.', '');
    }

    switch (data) {
      case _iiyby75a.Bounty():
        return 'Bounty';
      case _i81kb3qt.EcoImpact():
        return 'EcoImpact';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _iwb66hkj.HandoffTransaction():
        return 'HandoffTransaction';
      case _ij1pbnut.MaterialAnalysisResult():
        return 'MaterialAnalysisResult';
      case _iljslhxv.MaterialCategory():
        return 'MaterialCategory';
      case _isy11kxj.RewardType():
        return 'RewardType';
      case _id9obscz.Snap():
        return 'Snap';
    }
    className = _i1n3uhu0.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod_auth.$className';
    }
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Bounty') {
      return deserialize<_iiyby75a.Bounty>(data['data']);
    }
    if (dataClassName == 'EcoImpact') {
      return deserialize<_i81kb3qt.EcoImpact>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'HandoffTransaction') {
      return deserialize<_iwb66hkj.HandoffTransaction>(data['data']);
    }
    if (dataClassName == 'MaterialAnalysisResult') {
      return deserialize<_ij1pbnut.MaterialAnalysisResult>(data['data']);
    }
    if (dataClassName == 'MaterialCategory') {
      return deserialize<_iljslhxv.MaterialCategory>(data['data']);
    }
    if (dataClassName == 'RewardType') {
      return deserialize<_isy11kxj.RewardType>(data['data']);
    }
    if (dataClassName == 'Snap') {
      return deserialize<_id9obscz.Snap>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i1n3uhu0.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _i1n3uhu0.Protocol().registerHostProtocol('ungraey', this);
    _iais.Protocol().registerHostProtocol('ungraey', this);
    _iacs.Protocol().registerHostProtocol('ungraey', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _i1n3uhu0.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _iiyby75a.Bounty:
        return _iiyby75a.Bounty.t;
      case _i81kb3qt.EcoImpact:
        return _i81kb3qt.EcoImpact.t;
      case _iwb66hkj.HandoffTransaction:
        return _iwb66hkj.HandoffTransaction.t;
      case _id9obscz.Snap:
        return _id9obscz.Snap.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'ungraey';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i1n3uhu0.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
