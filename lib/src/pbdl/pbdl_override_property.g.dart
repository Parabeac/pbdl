// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_override_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLOverrideProperty _$PBDLOverridePropertyFromJson(
        Map<String, dynamic> json) =>
    PBDLOverrideProperty(
      json['UUID'] as String,
      json['name'] as String,
      json['ovrType'],
      json['value'] == null
          ? null
          : PBDLNode.fromJson(json['value'] as Map<String, dynamic>),
    )
      ..layoutMainAxisSizing = PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?)
      ..layoutCrossAxisSizing = PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?)
      ..child = json['child'] == null
          ? null
          : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
      ..constraints = json['constraints'] == null
          ? null
          : PBDLConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>)
      ..pbdlType = json['pbdlType'] as String?;

Map<String, dynamic> _$PBDLOverridePropertyToJson(
        PBDLOverrideProperty instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'value': instance.value?.toJson(),
      'pbdlType': instance.pbdlType,
      'ovrType': instance.ovrType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
