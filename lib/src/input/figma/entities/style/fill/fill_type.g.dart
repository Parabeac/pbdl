// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageFillType _$ImageFillTypeFromJson(Map<String, dynamic> json) =>
    ImageFillType(
      imageRef: json['imageRef'] as String?,
      blendMode: json['blendMode'] as String?,
      visible: json['visible'] as bool? ?? true,
      opacity: json['opacity'] as num? ?? 100,
      color: json['color'] == null
          ? null
          : FigmaColor.fromJson(json['color'] as Map<String, dynamic>),
    )..type = json['type'] as String?;

Map<String, dynamic> _$ImageFillTypeToJson(ImageFillType instance) =>
    <String, dynamic>{
      'imageRef': instance.imageRef,
      'type': instance.type,
      'blendMode': instance.blendMode,
      'visible': instance.visible,
      'opacity': instance.opacity,
      'color': instance.color,
    };

SolidFillType _$SolidFillTypeFromJson(Map<String, dynamic> json) =>
    SolidFillType(
      blendMode: json['blendMode'] as String?,
      visible: json['visible'] as bool? ?? true,
      opacity: json['opacity'] as num? ?? 100,
    )
      ..type = json['type'] as String?
      ..color = json['color'] == null
          ? null
          : FigmaColor.fromJson(json['color'] as Map<String, dynamic>);

Map<String, dynamic> _$SolidFillTypeToJson(SolidFillType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'color': instance.color,
      'blendMode': instance.blendMode,
      'visible': instance.visible,
      'opacity': instance.opacity,
    };
