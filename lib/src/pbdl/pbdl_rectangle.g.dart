// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_rectangle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLRectangle _$PBDLRectangleFromJson(Map<String, dynamic> json) =>
    PBDLRectangle(
      fixedRadius: json['fixedRadius'] as num?,
      UUID: json['UUID'] as String? ?? '',
      boundaryRectangle: json['boundaryRectangle'] == null
          ? null
          : PBDLBoundaryBox.fromJson(
              json['boundaryRectangle'] as Map<String, dynamic>),
      isVisible: json['isVisible'] as bool?,
      name: json['name'] as String?,
      style: json['style'] == null
          ? null
          : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
      child: json['child'] == null
          ? null
          : PBDLNode.fromJson(json['child'] as Map<String, dynamic>),
      prototypeNodeUUID: json['prototypeNodeUUID'] as String?,
      constraints: json['constraints'] == null
          ? null
          : PBDLConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
      layoutMainAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?),
      layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?),
    )..pbdlType = json['pbdlType'] as String?;

Map<String, dynamic> _$PBDLRectangleToJson(PBDLRectangle instance) =>
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
      'fixedRadius': instance.fixedRadius,
      'pbdlType': instance.pbdlType,
      'child': instance.child?.toJson(),
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
