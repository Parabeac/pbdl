// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_override_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLOverrideProperty _$PBDLOverridePropertyFromJson(Map<String, dynamic> json) {
  return PBDLOverrideProperty(
    json['UUID'] as String,
    json['name'] as String,
    json['isVisible'] as bool,
    json['boundaryRectangle'],
    json['type'] as String,
    json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    json['prototypeNodeUUID'] as String,
    json['value'],
  )
    ..pbdfType = json['pbdfType'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBDLOverridePropertyToJson(
        PBDLOverrideProperty instance) =>
    <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'type': instance.type,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'value': instance.value,
    };
