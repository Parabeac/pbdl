// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLImage _$PBDLImageFromJson(Map<String, dynamic> json) {
  return PBDLImage(
    imageReference: json['imageReference'] as String,
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
  )
    ..layoutMainAxisSizing = _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
    ..layoutCrossAxisSizing = _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLImageToJson(PBDLImage instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'style': instance.style?.toJson(),
      'imageReference': instance.imageReference,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
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
