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
            : OverridableValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    isVisible: json['isVisible'] as bool,
    boundaryRectangle: json['boundaryRectangle'],
    type: json['type'] as String,
    style: json['style'],
    symbolID: json['symbolID'] as String,
    pbdfType: json['pbdfType'] as String,
  )
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..parameters = json['parameters'] as List;
}

Map<String, dynamic> _$PBDLSharedInstanceNodeToJson(
        PBDLSharedInstanceNode instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle,
      'type': instance.type,
      'style': instance.style,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child,
      'symbolID': instance.symbolID,
      'parameters': instance.parameters,
      'pbdfType': instance.pbdfType,
      'overrideValues': instance.overrideValues,
    };
