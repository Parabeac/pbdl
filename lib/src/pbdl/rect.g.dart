// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_rect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLRect _$RectFromJson(Map<String, dynamic> json) {
  return PBDLRect(
    (json['x'] as num)?.toDouble(),
    (json['y'] as num)?.toDouble(),
    (json['width'] as num)?.toDouble(),
    (json['height'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RectToJson(PBDLRect instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
    };
