// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_border_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBorderOptions _$PBDLBorderOptionsFromJson(Map<String, dynamic> json) {
  return PBDLBorderOptions(
    isEnabled: json['isEnabled'] as bool,
    dashPattern: json['dashPattern'] as List,
    lineCapStyle: json['lineCapStyle'] as int,
    lineJoinStyle: json['lineJoinStyle'] as int,
  );
}

Map<String, dynamic> _$PBDLBorderOptionsToJson(PBDLBorderOptions instance) =>
    <String, dynamic>{
      'isEnabled': instance.isEnabled,
      'dashPattern': instance.dashPattern,
      'lineCapStyle': instance.lineCapStyle,
      'lineJoinStyle': instance.lineJoinStyle,
    };
