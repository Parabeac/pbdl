// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_override_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLOverrideValue _$PBDLOverrideValueFromJson(Map<String, dynamic> json) {
  return PBDLOverrideValue(
    json['UUID'] as String,
    json['name'] as String,
    json['ovrType'],
    json['value'] == null
        ? null
        : PBDLNode.fromJson(json['value'] as Map<String, dynamic>),
    json['valueName'] as String,
  )
    ..layoutMainAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String)
    ..layoutCrossAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutCrossAxisSizing'] as String)
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
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLOverrideValueToJson(PBDLOverrideValue instance) =>
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
      'value': instance.value?.toJson(),
      'valueName': instance.valueName,
      'pbdlType': instance.pbdlType,
      'ovrType': instance.ovrType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
