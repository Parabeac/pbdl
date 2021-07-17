// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_shared_master_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLSharedMasterNode _$PBDLSharedMasterNodeFromJson(Map<String, dynamic> json) {
  return PBDLSharedMasterNode(
    UUID: json['UUID'] as String,
    overrideProperties: (json['overrideProperties'] as List)
        ?.map((e) => e == null
            ? null
            : PBDLOverrideProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    isVisible: json['isVisible'] as bool,
    boundaryRectangle: json['boundaryRectangle'],
    type: json['type'] as String,
    style: json['style'],
    pbdfType: json['pbdfType'] as String,
    symbolID: json['symbolID'] as String,
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBDLSharedMasterNodeToJson(
        PBDLSharedMasterNode instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'type': instance.type,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'symbolID': instance.symbolID,
      'overrideProperties':
          instance.overrideProperties?.map((e) => e?.toJson())?.toList(),
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'pbdfType': instance.pbdfType,
    };
