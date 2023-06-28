// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_effect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaEffect _$FigmaEffectFromJson(Map<String, dynamic> json) => FigmaEffect(
      type: json['type'] as String?,
      visible: json['visible'] as bool?,
      radius: json['radius'] as num?,
      color: json['color'] == null
          ? null
          : FigmaColor.fromJson(json['color'] as Map<String, dynamic>),
      blendMode: json['blendMode'] as String?,
      offset: json['offset'] as Map<String, dynamic>?,
      showShadowBehindNode: json['showShadowBehindNode'] as bool?,
    );

Map<String, dynamic> _$FigmaEffectToJson(FigmaEffect instance) =>
    <String, dynamic>{
      'type': instance.type,
      'visible': instance.visible,
      'radius': instance.radius,
      'color': instance.color,
      'blendMode': instance.blendMode,
      'offset': instance.offset,
      'showShadowBehindNode': instance.showShadowBehindNode,
    };
