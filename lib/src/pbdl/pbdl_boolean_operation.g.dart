// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_boolean_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBooleanOperation _$PBDLBooleanOperationFromJson(Map<String, dynamic> json) {
  return PBDLBooleanOperation(
    children: json['children'],
    booleanOperation: json['booleanOperation'],
    type: json['type'],
    style: json['style'],
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    UUID: json['UUID'] as String,
    prototypeNodeUUID: json['prototypeNodeUUID'],
    imageReference: json['imageReference'],
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
  )
    ..layoutMainAxisSizing = _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
    ..layoutCrossAxisSizing = _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..layoutAlign = json['layoutAlign']
    ..size = json['size']
    ..strokes = json['strokes']
    ..strokeWeight = json['strokeWeight']
    ..strokeAlign = json['strokeAlign']
    ..styles = json['styles']
    ..fillsList = json['fillsList']
    ..name = json['name'] as String
    ..isVisible = json['isVisible'] as bool
    ..image = json['image'];
}

Map<String, dynamic> _$PBDLBooleanOperationToJson(
        PBDLBooleanOperation instance) =>
    <String, dynamic>{
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'layoutAlign': instance.layoutAlign,
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'fillsList': instance.fillsList,
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'booleanOperation': instance.booleanOperation,
      'type': instance.type,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'imageReference': instance.imageReference,
      'UUID': instance.UUID,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style?.toJson(),
      'isVisible': instance.isVisible,
      'image': instance.image,
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
