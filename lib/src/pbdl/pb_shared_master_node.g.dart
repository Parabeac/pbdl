// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_shared_master_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLSharedMasterNode _$PBSharedMasterDesignNodeFromJson(
    Map<String, dynamic> json) {
  return PBDLSharedMasterNode(
    UUID: json['UUID'] as String,
    overrideProperties: json['overrideProperties'],
    name: json['name'] as String,
    isVisible: json['isVisible'] as bool,
    boundaryRectangle: json['boundaryRectangle'],
    type: json['type'] as String,
    style: json['style'],
    pbdfType: json['pbdfType'] as String,
    symbolID: json['symbolID'] as String,
  )
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..overriadableProperties = json['overriadableProperties'] as List
    ..children = json['children'] as List;
}

Map<String, dynamic> _$PBSharedMasterDesignNodeToJson(
        PBDLSharedMasterNode instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle,
      'type': instance.type,
      'style': instance.style,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'symbolID': instance.symbolID,
      'overriadableProperties': instance.overriadableProperties,
      'overrideProperties': instance.overrideProperties,
      'pbdfType': instance.pbdfType,
      'children': instance.children,
    };
