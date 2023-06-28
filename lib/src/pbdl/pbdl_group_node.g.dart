// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_group_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLGroupNode _$PBDLGroupNodeFromJson(Map<String, dynamic> json) =>
    PBDLGroupNode(
      UUID: json['UUID'] as String? ?? '',
      boundaryRectangle: json['boundaryRectangle'] == null
          ? null
          : PBDLBoundaryBox.fromJson(
              json['boundaryRectangle'] as Map<String, dynamic>),
      isVisible: json['isVisible'] as bool?,
      name: json['name'] as String?,
      constraints: json['constraints'] == null
          ? null
          : PBDLConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
      style: json['style'] == null
          ? null
          : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      prototypeNodeUUID: json['prototypeNodeUUID'] as String?,
      layoutMainAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?),
      layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?),
    )..pbdlType = json['pbdlType'] as String?;

Map<String, dynamic> _$PBDLGroupNodeToJson(PBDLGroupNode instance) =>
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
      'constraints': instance.constraints?.toJson(),
      'children': instance.children?.map((e) => e?.toJson()).toList(),
      'pbdlType': instance.pbdlType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
