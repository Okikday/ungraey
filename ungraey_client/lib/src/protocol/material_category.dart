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

enum MaterialCategory implements _isc.SerializableModel {
  corrugatedCardboard,
  treatedLumber,
  hardwoodScrap,
  scrapDenimTextiles,
  cleanGlassJars,
  electronicsScrap,
  metalScrap,
  plasticContainers,
  other;

  static MaterialCategory fromJson(String name) {
    switch (name) {
      case 'corrugatedCardboard':
        return MaterialCategory.corrugatedCardboard;
      case 'treatedLumber':
        return MaterialCategory.treatedLumber;
      case 'hardwoodScrap':
        return MaterialCategory.hardwoodScrap;
      case 'scrapDenimTextiles':
        return MaterialCategory.scrapDenimTextiles;
      case 'cleanGlassJars':
        return MaterialCategory.cleanGlassJars;
      case 'electronicsScrap':
        return MaterialCategory.electronicsScrap;
      case 'metalScrap':
        return MaterialCategory.metalScrap;
      case 'plasticContainers':
        return MaterialCategory.plasticContainers;
      case 'other':
        return MaterialCategory.other;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "MaterialCategory"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
