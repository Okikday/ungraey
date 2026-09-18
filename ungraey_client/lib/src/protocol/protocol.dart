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
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:ungraey_client/src/protocol/bounty.dart' as _ia79p7gr;
import 'bounty.dart' as _iiyby75a;
import 'eco_impact.dart' as _i81kb3qt;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'handoff_transaction.dart' as _iwb66hkj;
import 'material_category.dart' as _iljslhxv;
import 'reward_type.dart' as _isy11kxj;
import 'snap.dart' as _id9obscz;
export 'bounty.dart';
export 'eco_impact.dart';
export 'greetings/greeting.dart';
export 'handoff_transaction.dart';
export 'material_category.dart';
export 'reward_type.dart';
export 'snap.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

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
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _iljslhxv.MaterialCategory) {
      return _iljslhxv.MaterialCategory.fromJson(data) as T;
    }
    if (t == _isy11kxj.RewardType) {
      return _isy11kxj.RewardType.fromJson(data) as T;
    }
    if (t == _id9obscz.Snap) {
      return _id9obscz.Snap.fromJson(data) as T;
    }
    if (t == _isc.getType<_iiyby75a.Bounty?>()) {
      return (data != null ? _iiyby75a.Bounty.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i81kb3qt.EcoImpact?>()) {
      return (data != null ? _i81kb3qt.EcoImpact.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iwb66hkj.HandoffTransaction?>()) {
      return (data != null ? _iwb66hkj.HandoffTransaction.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iljslhxv.MaterialCategory?>()) {
      return (data != null ? _iljslhxv.MaterialCategory.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_isy11kxj.RewardType?>()) {
      return (data != null ? _isy11kxj.RewardType.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_id9obscz.Snap?>()) {
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
    if (t == List<_ia79p7gr.Bounty>) {
      return (data as List)
              .map((e) => deserialize<_ia79p7gr.Bounty>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _iiyby75a.Bounty => 'Bounty',
      _i81kb3qt.EcoImpact => 'EcoImpact',
      _izw8z7ou.Greeting => 'Greeting',
      _iwb66hkj.HandoffTransaction => 'HandoffTransaction',
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
      case _iljslhxv.MaterialCategory():
        return 'MaterialCategory';
      case _isy11kxj.RewardType():
        return 'RewardType';
      case _id9obscz.Snap():
        return 'Snap';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
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
    if (dataClassName == 'MaterialCategory') {
      return deserialize<_iljslhxv.MaterialCategory>(data['data']);
    }
    if (dataClassName == 'RewardType') {
      return deserialize<_isy11kxj.RewardType>(data['data']);
    }
    if (dataClassName == 'Snap') {
      return deserialize<_id9obscz.Snap>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('ungraey', this);
    _iacc.Protocol().registerHostProtocol('ungraey', this);
  }

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
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
