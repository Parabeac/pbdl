// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_rectangle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLRectangle _$PBDLRectangleFromJson(Map<String, dynamic> json) {
  return PBDLRectangle(
    fixedRadius: json['fixedRadius'],
    hasConvertedToNewRoundCorners: json['hasConvertedToNewRoundCorners'],
    needsConvertionToNewRoundCorners: json['needsConvertionToNewRoundCorners'],
    points: json['points'] as List,
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    type: json['type'] as String,
    pbdfType: json['pbdfType'] as String,
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    child: json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>),
  )..prototypeNodeUUID = json['prototypeNodeUUID'] as String;
}

Map<String, dynamic> _$PBDLRectangleToJson(PBDLRectangle instance) =>
    <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'hasConvertedToNewRoundCorners': instance.hasConvertedToNewRoundCorners,
      'fixedRadius': instance.fixedRadius,
      'needsConvertionToNewRoundCorners':
          instance.needsConvertionToNewRoundCorners,
      'points': instance.points,
      'UUID': instance.UUID,
      'boundaryRectangle': instance.boundaryRectangle,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
      'child': instance.child,
    };
