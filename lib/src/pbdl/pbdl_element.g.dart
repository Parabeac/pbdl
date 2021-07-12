// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLElement _$PBDLElementFromJson(Map<String, dynamic> json) {
  return PBDLElement(
    UUID: json['UUID'],
    name: json['name'],
    isVisible: json['isVisible'],
    boundaryRectangle: json['boundaryRectangle'],
    type: json['type'],
    style: json['style'],
    prototypeNodeUUID: json['prototypeNodeUUID'],
  )..pbdfType = json['pbdfType'] as String;
}

Map<String, dynamic> _$PBDLElementToJson(PBDLElement instance) =>
    <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle,
      'type': instance.type,
      'style': instance.style,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
    };
