// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLElement _$PBDLElementFromJson(Map<String, dynamic> json) => PBDLElement(
      UUID: json['UUID'],
      name: json['name'],
      isVisible: json['isVisible'],
      boundaryRectangle: json['boundaryRectangle'],
      style: json['style'] == null
          ? null
          : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
      prototypeNodeUUID: json['prototypeNodeUUID'],
      constraints: json['constraints'] == null
          ? null
          : PBDLConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
      layoutMainAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?),
      layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?),
    )
      ..child = json['child'] == null
          ? null
          : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
      ..pbdlType = json['pbdlType'] as String?;

Map<String, dynamic> _$PBDLElementToJson(PBDLElement instance) =>
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
      'pbdlType': instance.pbdlType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
