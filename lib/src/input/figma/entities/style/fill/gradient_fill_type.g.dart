// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_fill_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradientFillType _$GradientFillTypeFromJson(Map<String, dynamic> json) =>
    GradientFillType(
      gradientStops: (json['gradientStops'] as List<dynamic>?)
          ?.map((e) => GradientStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      gradientHandlePositions: json['gradientHandlePositions'] == null
          ? const []
          : GradientFillType._pointsFromJson(
              json['gradientHandlePositions'] as List),
      blendMode: json['blendMode'] as String?,
      visible: json['visible'] as bool? ?? true,
      opacity: json['opacity'] as num? ?? 100,
    )
      ..color = json['color'] == null
          ? null
          : FigmaColor.fromJson(json['color'] as Map<String, dynamic>)
      ..type = json['type'] as String?;

Map<String, dynamic> _$GradientFillTypeToJson(GradientFillType instance) =>
    <String, dynamic>{
      'gradientStops': instance.gradientStops,
      'gradientHandlePositions':
          GradientFillType._pointsToJson(instance.gradientHandlePositions),
      'color': instance.color,
      'type': instance.type,
      'blendMode': instance.blendMode,
      'visible': instance.visible,
      'opacity': instance.opacity,
    };

GradientStop _$GradientStopFromJson(Map<String, dynamic> json) => GradientStop(
      color: json['color'] == null
          ? null
          : FigmaColor.fromJson(json['color'] as Map<String, dynamic>),
      position: json['position'] as num?,
    );

Map<String, dynamic> _$GradientStopToJson(GradientStop instance) =>
    <String, dynamic>{
      'color': instance.color,
      'position': instance.position,
    };
