// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFill _$PBDLFillFromJson(Map<String, dynamic> json) => PBDLFill(
      opacity: json['opacity'] as num? ?? 100,
      blendMode: json['blendMode'] as String?,
      type: json['type'] as String?,
      isEnabled: json['isEnabled'] as bool? ?? true,
      color: json['color'] == null
          ? null
          : PBDLColor.fromJson(json['color'] as Map<String, dynamic>),
      imageRef: json['imageRef'] as String?,
      gradientStops: (json['gradientStops'] as List<dynamic>?)
          ?.map((e) => PBDLGradientStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      gradientHandlePositions:
          PBDLFill._pointsFromJson(json['gradientHandlePositions'] as List),
    );

Map<String, dynamic> _$PBDLFillToJson(PBDLFill instance) => <String, dynamic>{
      'gradientStops': instance.gradientStops?.map((e) => e.toJson()).toList(),
      'gradientHandlePositions':
          PBDLFill._pointsToJson(instance.gradientHandlePositions),
      'imageRef': instance.imageRef,
      'color': instance.color?.toJson(),
      'opacity': instance.opacity,
      'blendMode': instance.blendMode,
      'type': instance.type,
      'isEnabled': instance.isEnabled,
    };

PBDLGradientStop _$PBDLGradientStopFromJson(Map<String, dynamic> json) =>
    PBDLGradientStop(
      color: json['color'] == null
          ? null
          : PBDLColor.fromJson(json['color'] as Map<String, dynamic>),
      position: json['position'] as num?,
    );

Map<String, dynamic> _$PBDLGradientStopToJson(PBDLGradientStop instance) =>
    <String, dynamic>{
      'color': instance.color?.toJson(),
      'position': instance.position,
    };
