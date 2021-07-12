// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_star.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLStar _$StarFromJson(Map<String, dynamic> json) {
  return PBDLStar(
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
  )..prototypeNodeUUID = json['prototypeNodeUUID'] as String;
}

Map<String, dynamic> _$StarToJson(PBDLStar instance) => <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'boundaryRectangle': instance.boundaryRectangle,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
    };
