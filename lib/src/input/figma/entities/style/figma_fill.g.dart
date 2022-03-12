// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaFill _$FigmaFillFromJson(Map<String, dynamic> json) {
  return FigmaFill(
    json['opacity'] as num ?? 100,
    json['blendMode'] as String,
    json['type'] as String,
    json['visible'] as bool ?? true,
    json['color'] == null
        ? null
        : FigmaColor.fromJson(json['color'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FigmaFillToJson(FigmaFill instance) => <String, dynamic>{
      'color': instance.color,
      'opacity': instance.opacity,
      'blendMode': instance.blendMode,
      'type': instance.type,
      'visible': instance.visible,
    };
