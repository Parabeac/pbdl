// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DesignElement _$DesignElementFromJson(Map<String, dynamic> json) {
  return DesignElement(
    UUID: json['UUID'],
    name: json['name'],
    isVisible: json['isVisible'],
    boundaryRectangle: json['boundaryRectangle'],
    type: json['type'],
    style: json['style'],
    prototypeNodeUUID: json['prototypeNodeUUID'],
  )..pbdfType = json['pbdfType'] as String;
}

Map<String, dynamic> _$DesignElementToJson(DesignElement instance) =>
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
