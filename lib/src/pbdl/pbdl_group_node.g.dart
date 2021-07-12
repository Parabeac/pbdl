// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_group_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLGroupNode _$PBDLGroupNodeFromJson(Map<String, dynamic> json) {
  return PBDLGroupNode(
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    pbdfType: json['pbdfType'] as String,
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
  )
    ..children = json['children'] as List
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLGroupNodeToJson(PBDLGroupNode instance) =>
    <String, dynamic>{
      'children': instance.children,
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'boundaryRectangle': instance.boundaryRectangle,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
    };
