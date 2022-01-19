// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_style_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaStyleProperty _$FigmaStylePropertyFromJson(Map<String, dynamic> json) {
  return FigmaStyleProperty(
    (json['fills'] as List)
        ?.map((e) =>
            e == null ? null : FigmaFill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['strokes'] as List)
        ?.map((e) =>
            e == null ? null : FigmaStroke.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['effects'] as List)
        ?.map((e) =>
            e == null ? null : FigmaEffect.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FigmaStylePropertyToJson(FigmaStyleProperty instance) =>
    <String, dynamic>{
      'fills': instance.fills,
      'strokes': instance.strokes,
      'effects': instance.effects,
    };
