// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFrame _$PBDLFrameFromJson(Map<String, dynamic> json) {
  return PBDLFrame(
    constrainProportions: json['constrainProportions'] as bool,
    x: (json['x'] as num)?.toDouble(),
    y: (json['y'] as num)?.toDouble(),
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
  )..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLFrameToJson(PBDLFrame instance) => <String, dynamic>{
      'constrainProportions': instance.constrainProportions,
      'constraints': instance.constraints?.toJson(),
      'height': instance.height,
      'width': instance.width,
      'x': instance.x,
      'y': instance.y,
      'type': instance.type,
    };
