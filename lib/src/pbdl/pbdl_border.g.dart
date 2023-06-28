// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_border.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBorder _$PBDLBorderFromJson(Map<String, dynamic> json) => PBDLBorder(
      blendMode: json['blendMode'] as String?,
      type: json['type'] as String?,
      color: json['color'] == null
          ? null
          : PBDLColor.fromJson(json['color'] as Map<String, dynamic>),
      visible: json['visible'] as bool? ?? true,
    );

Map<String, dynamic> _$PBDLBorderToJson(PBDLBorder instance) =>
    <String, dynamic>{
      'blendMode': instance.blendMode,
      'type': instance.type,
      'color': instance.color?.toJson(),
      'visible': instance.visible,
    };
