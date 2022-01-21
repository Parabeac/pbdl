// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaStroke _$FigmaStrokeFromJson(Map<String, dynamic> json) {
  return FigmaStroke(
    blendMode: json['blendMode'] as String,
    type: json['type'] as String,
    color: json['color'] == null
        ? null
        : FigmaColor.fromJson(json['color'] as Map<String, dynamic>),
  )..visible = json['visible'] as bool ?? true;
}

Map<String, dynamic> _$FigmaStrokeToJson(FigmaStroke instance) =>
    <String, dynamic>{
      'blendMode': instance.blendMode,
      'type': instance.type,
      'color': instance.color,
      'visible': instance.visible,
    };
