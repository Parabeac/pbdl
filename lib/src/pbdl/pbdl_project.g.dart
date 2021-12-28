// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLProject _$PBDLProjectFromJson(Map<String, dynamic> json) {
  return PBDLProject(
    name: json['name'] as String,
    UUID: json['UUID'] as String,
    pages: (json['pages'] as List)
        ?.map((e) =>
            e == null ? null : PBDLPage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pngPath: json['pngPath'] as String,
  )
    ..layoutMainAxisSizing = _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
    ..layoutCrossAxisSizing = _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
    ..isVisible = json['isVisible'] as bool
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>)
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..constraints = json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>)
    ..debug = json['debug'] as bool
    ..miscPages = (json['miscPages'] as List)
        ?.map((e) =>
            e == null ? null : PBDLPage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..sharedStyles = (json['sharedStyles'] as List)
        ?.map((e) =>
            e == null ? null : SharedStyle.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLProjectToJson(PBDLProject instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'debug': instance.debug,
      'pngPath': instance.pngPath,
      'pages': instance.pages?.map((e) => e?.toJson())?.toList(),
      'miscPages': instance.miscPages?.map((e) => e?.toJson())?.toList(),
      'sharedStyles': instance.sharedStyles?.map((e) => e?.toJson())?.toList(),
      'type': instance.type,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
