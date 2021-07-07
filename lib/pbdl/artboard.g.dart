// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBArtboard _$PBArtboardFromJson(Map<String, dynamic> json) {
  return PBArtboard(
    backgroundColor: json['backgroundColor'] == null
        ? null
        : PBColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
    isFlowHome: json['isFlowHome'],
    UUID: json['UUID'],
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'],
    name: json['name'],
    type: json['type'],
    style: json['style'] == null
        ? null
        : PBStyle.fromJson(json['style'] as Map<String, dynamic>),
  )
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..children = json['children'] as List
    ..pbdfType = json['pbdfType'] as String;
}

Map<String, dynamic> _$PBArtboardToJson(PBArtboard instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'type': instance.type,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'backgroundColor': instance.backgroundColor,
      'boundaryRectangle': instance.boundaryRectangle,
      'isFlowHome': instance.isFlowHome,
      'style': instance.style,
      'children': instance.children,
      'pbdfType': instance.pbdfType,
    };
