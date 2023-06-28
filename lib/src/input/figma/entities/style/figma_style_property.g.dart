// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_style_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaStyleProperty _$FigmaStylePropertyFromJson(Map<String, dynamic> json) =>
    FigmaStyleProperty(
      fills: (json['fills'] as List<dynamic>?)
          ?.map((e) => FigmaFill.fromJson(e as Map<String, dynamic>?))
          .toList(),
      stroke: json['stroke'] == null
          ? null
          : FigmaStroke.fromJson(json['stroke'] as Map<String, dynamic>),
      effects: (json['effects'] as List<dynamic>?)
          ?.map((e) => FigmaEffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      clipsContent: json['clipsContent'] as bool?,
    );

Map<String, dynamic> _$FigmaStylePropertyToJson(FigmaStyleProperty instance) =>
    <String, dynamic>{
      'fills': instance.fills,
      'stroke': instance.stroke,
      'effects': instance.effects,
      'clipsContent': instance.clipsContent,
    };
