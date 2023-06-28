// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_shared_master_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLSharedMasterNode _$PBDLSharedMasterNodeFromJson(
        Map<String, dynamic> json) =>
    PBDLSharedMasterNode(
      UUID: json['UUID'] as String? ?? '',
      overrideProperties: (json['overrideProperties'] as List<dynamic>?)
          ?.map((e) => PBDLOverrideProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      isVisible: json['isVisible'] as bool?,
      boundaryRectangle: json['boundaryRectangle'] == null
          ? null
          : PBDLBoundaryBox.fromJson(
              json['boundaryRectangle'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
      prototypeNodeUUID: json['prototypeNodeUUID'] as String?,
      constraints: json['constraints'],
      symbolID: json['symbolID'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      layoutMainAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?),
      layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?),
      sharedNodeSetID: json['sharedNodeSetID'] as String?,
      componentSetName: json['componentSetName'] as String?,
    )
      ..child = json['child'] == null
          ? null
          : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
      ..pbdlType = json['pbdlType'] as String?;

Map<String, dynamic> _$PBDLSharedMasterNodeToJson(
        PBDLSharedMasterNode instance) =>
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
      'overrideProperties':
          instance.overrideProperties?.map((e) => e.toJson()).toList(),
      'children': instance.children?.map((e) => e?.toJson()).toList(),
      'pbdlType': instance.pbdlType,
      'componentSetName': instance.componentSetName,
      'sharedNodeSetID': instance.sharedNodeSetID,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
