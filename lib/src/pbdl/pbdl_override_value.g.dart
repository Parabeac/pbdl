// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_override_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLOverrideValue _$PBDLOverrideValueFromJson(Map<String, dynamic> json) {
  return PBDLOverrideValue(
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
  )..child = json['child'] == null
      ? null
      : PBDLNode.fromJson(json['child'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBDLOverrideValueToJson(PBDLOverrideValue instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle,
      'style': instance.style,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child,
      'value': instance.value,
      'type': instance.type,
    };
