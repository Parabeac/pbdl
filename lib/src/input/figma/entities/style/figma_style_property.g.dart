// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_style_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaStyleProperty _$FigmaStylePropertyFromJson(Map<String, dynamic> json) {
  return FigmaStyleProperty(
    fills: (json['fills'] as List)
        ?.map((e) =>
            e == null ? null : FigmaFill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stroke: json['stroke'] == null
        ? null
        : FigmaStroke.fromJson(json['stroke'] as Map<String, dynamic>),
    effects: (json['effects'] as List)
        ?.map((e) =>
            e == null ? null : FigmaEffect.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FigmaStylePropertyToJson(FigmaStyleProperty instance) =>
    <String, dynamic>{
      'fills': instance.fills,
      'stroke': instance.stroke,
      'effects': instance.effects,
    };
