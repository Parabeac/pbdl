// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaStroke _$FigmaStrokeFromJson(Map<String, dynamic> json) {
  return FigmaStroke(
    strokes: (json['strokes'] as List)
        ?.map((e) => e == null
            ? null
            : FigmaListStroke.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    strokeWeight: json['strokeWeight'] as num,
    strokeAlign: json['strokeAlign'] as String,
    strokeJoin: json['strokeJoin'] as String,
    strokeDashes: json['strokeDashes'] as List,
    cornerRadius: json['cornerRadius'] as num,
  );
}

Map<String, dynamic> _$FigmaStrokeToJson(FigmaStroke instance) =>
    <String, dynamic>{
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'strokeJoin': instance.strokeJoin,
      'strokeDashes': instance.strokeDashes,
      'cornerRadius': instance.cornerRadius,
    };
