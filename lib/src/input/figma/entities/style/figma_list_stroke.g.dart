// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_list_stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaListStroke _$FigmaListStrokeFromJson(Map<String, dynamic> json) =>
    FigmaListStroke(
      blendMode: json['blendMode'] as String?,
      type: json['type'] as String?,
      color: json['color'] == null
          ? null
          : FigmaColor.fromJson(json['color'] as Map<String, dynamic>),
    )..visible = json['visible'] as bool? ?? true;

Map<String, dynamic> _$FigmaListStrokeToJson(FigmaListStroke instance) =>
    <String, dynamic>{
      'blendMode': instance.blendMode,
      'type': instance.type,
      'color': instance.color,
      'visible': instance.visible,
    };
