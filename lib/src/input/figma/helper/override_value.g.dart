// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'override_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaOverridableValue _$FigmaOverridableValueFromJson(
        Map<String, dynamic> json) =>
    FigmaOverridableValue(
      json['overrideName'] as String?,
      json['do_objectID'] as String?,
      json['value'],
    );

Map<String, dynamic> _$FigmaOverridableValueToJson(
        FigmaOverridableValue instance) =>
    <String, dynamic>{
      'overrideName': instance.overrideName,
      'do_objectID': instance.UUID,
      'value': instance.value,
    };
