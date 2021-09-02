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
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
  )..child = json['child'] == null
      ? null
      : PBDLNode.fromJson(json['child'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBDLElementToJson(PBDLElement instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'type': instance.type,
    };
