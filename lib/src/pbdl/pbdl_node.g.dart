// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLNode _$PBDLNodeFromJson(Map<String, dynamic> json) {
  return PBDLNode(
    json['UUID'] as String,
    json['name'] as String,
    json['isVisible'] as bool,
    json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    json['prototypeNodeUUID'] as String,
    child: json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>),
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    layoutMainAxisSizing: _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing']),
    layoutCrossAxisSizing: _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing']),
  )..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLNodeToJson(PBDLNode instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'type': instance.type,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
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
