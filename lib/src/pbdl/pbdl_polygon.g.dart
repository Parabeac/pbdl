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
    isVisible: json['isVisible'],
    name: json['name'],
    type: json['type'],
    pbdfType: json['pbdfType'],
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    child: json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>),
  )..prototypeNodeUUID = json['prototypeNodeUUID'] as String;
}

Map<String, dynamic> _$PBDLPolygonToJson(PBDLPolygon instance) =>
    <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'boundaryRectangle': instance.boundaryRectangle,
      'UUID': instance.UUID,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
      'child': instance.child,
    };