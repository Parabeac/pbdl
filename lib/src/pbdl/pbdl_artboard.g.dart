// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_artboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLArtboard _$PBDLArtboardFromJson(Map<String, dynamic> json) => PBDLArtboard(
      backgroundColor: json['backgroundColor'] == null
          ? null
          : PBDLColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
      isFlowHome: json['isFlowHome'],
      UUID: json['UUID'] ?? '',
      boundaryRectangle: json['boundaryRectangle'] == null
          ? null
          : PBDLBoundaryBox.fromJson(
              json['boundaryRectangle'] as Map<String, dynamic>),
      isVisible: json['isVisible'],
      name: json['name'],
      constraints: json['constraints'] == null
          ? null
          : PBDLConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
      prototypeNodeUUID: json['prototypeNodeUUID'],
      style: json['style'] == null
          ? null
          : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      layoutMainAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?),
      layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?),
    )
      ..child = json['child'] == null
          ? null
          : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
      ..pbdlType = json['pbdlType'] as String?;

Map<String, dynamic> _$PBDLArtboardToJson(PBDLArtboard instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'isVisible': instance.isVisible,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'backgroundColor': instance.backgroundColor?.toJson(),
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'isFlowHome': instance.isFlowHome,
      'pbdlType': instance.pbdlType,
      'children': instance.children?.map((e) => e?.toJson()).toList(),
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
