// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_override_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLOverrideValue _$PBDLOverrideValueFromJson(Map<String, dynamic> json) {
  return PBDLOverrideValue(
    json['UUID'] as String,
    json['name'] as String,
    json['type'] as String,
    json['value'],
  )..child = json['child'] == null
      ? null
      : PBDLNode.fromJson(json['child'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBDLOverrideValueToJson(PBDLOverrideValue instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'child': instance.child,
      'value': instance.value,
      'type': instance.type,
    };
