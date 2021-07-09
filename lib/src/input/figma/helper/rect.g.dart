// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaRect _$FigmaRectFromJson(Map<String, dynamic> json) {
  return FigmaRect(
    x: (json['x'] as num)?.toDouble(),
    y: (json['y'] as num)?.toDouble(),
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FigmaRectToJson(FigmaRect instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
    };
