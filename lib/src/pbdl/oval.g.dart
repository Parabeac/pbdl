// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oval _$OvalFromJson(Map<String, dynamic> json) {
  return Oval(
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    type: json['type'],
    pbdfType: json['pbdfType'] as String,
    style: json['style'] == null
        ? null
        : PBStyle.fromJson(json['style'] as Map<String, dynamic>),
  )..prototypeNodeUUID = json['prototypeNodeUUID'] as String;
}

Map<String, dynamic> _$OvalToJson(Oval instance) => <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'boundaryRectangle': instance.boundaryRectangle,
      'UUID': instance.UUID,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
    };
