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
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    style: json['style'],
    symbolID: json['symbolID'] as String,
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
    sharedNodeSetID: json['sharedNodeSetID'] as String,
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..parameters = json['parameters'] as List
    ..pbdlType = json['type'] as String;
}

Map<String, dynamic> _$PBDLSharedInstanceNodeToJson(
        PBDLSharedInstanceNode instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'symbolID': instance.symbolID,
      'parameters': instance.parameters,
      'overrideValues':
          instance.overrideValues?.map((e) => e?.toJson())?.toList(),
      'sharedNodeSetID': instance.sharedNodeSetID,
      'type': instance.pbdlType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
