// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_polygon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLPolygon _$PBDLPolygonFromJson(Map<String, dynamic> json) {
  return PBDLPolygon(
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    child: json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>),
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
  )
    ..constraints = json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLPolygonToJson(PBDLPolygon instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isVisible': instance.isVisible,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'constraints': instance.constraints?.toJson(),
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'UUID': instance.UUID,
      'type': instance.type,
      'child': instance.child?.toJson(),
    };
