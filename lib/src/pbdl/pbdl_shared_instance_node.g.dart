// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_shared_instance_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLSharedInstanceNode _$PBDLSharedInstanceNodeFromJson(
    Map<String, dynamic> json) {
  return PBDLSharedInstanceNode(
    UUID: json['UUID'] as String,
    overrideValues: (json['overrideValues'] as List)
        ?.map((e) => e == null
            ? null
            : PBDLOverrideValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    isVisible: json['isVisible'] as bool,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    style: json['style'],
    symbolID: json['symbolID'] as String,
    pbdfType: json['pbdfType'] as String,
  )
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..parameters = json['parameters'] as List
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLSharedInstanceNodeToJson(
        PBDLSharedInstanceNode instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'symbolID': instance.symbolID,
      'parameters': instance.parameters,
      'overrideValues':
          instance.overrideValues?.map((e) => e?.toJson())?.toList(),
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'type': instance.type,
      'pbdfType': instance.pbdfType,
    };
