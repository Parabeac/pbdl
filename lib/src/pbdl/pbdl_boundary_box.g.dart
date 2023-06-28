// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_boundary_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBoundaryBox _$PBDLBoundaryBoxFromJson(Map<String, dynamic> json) =>
    PBDLBoundaryBox(
      constrainProportions: json['constrainProportions'] as bool?,
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      constraints: json['constraints'] == null
          ? null
          : PBDLConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
    )..type = json['type'] as String?;

Map<String, dynamic> _$PBDLBoundaryBoxToJson(PBDLBoundaryBox instance) =>
    <String, dynamic>{
      'constrainProportions': instance.constrainProportions,
      'constraints': instance.constraints,
      'height': instance.height,
      'width': instance.width,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'type': instance.type,
    };
