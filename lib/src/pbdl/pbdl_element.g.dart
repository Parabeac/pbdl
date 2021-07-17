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
  )
    ..pbdfType = json['pbdfType'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBDLElementToJson(PBDLElement instance) =>
    <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'type': instance.type,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
    };
