// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_border_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBBorderOptions _$PBBorderOptionsFromJson(Map<String, dynamic> json) {
  return PBBorderOptions(
    isEnabled: json['isEnabled'] as bool,
    dashPattern: json['dashPattern'] as List,
    lineCapStyle: json['lineCapStyle'] as int,
    lineJoinStyle: json['lineJoinStyle'] as int,
  );
}

Map<String, dynamic> _$PBBorderOptionsToJson(PBBorderOptions instance) =>
    <String, dynamic>{
      'isEnabled': instance.isEnabled,
      'dashPattern': instance.dashPattern,
      'lineCapStyle': instance.lineCapStyle,
      'lineJoinStyle': instance.lineJoinStyle,
    };
