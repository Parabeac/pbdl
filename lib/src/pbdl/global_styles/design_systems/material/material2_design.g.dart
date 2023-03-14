// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material2_design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialDesign2 _$MaterialDesign2FromJson(Map<String, dynamic> json) {
  return MaterialDesign2()
    ..UUID = json['UUID'] as String
    ..layoutMainAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String)
    ..layoutCrossAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutCrossAxisSizing'] as String)
    ..name = json['name'] as String
    ..isVisible = json['isVisible'] as bool
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>)
    ..pbdlType = json['pbdlType'] as String
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..constraints = json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>)
    ..textStyles =
        (json['textStyles'] as List)?.map((e) => e as String)?.toList()
    ..colorSchemes = (json['colorSchemes'] as List)
        ?.map((e) => e == null
            ? null
            : DesignSystemColorScheme.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MaterialDesign2ToJson(MaterialDesign2 instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'pbdlType': instance.pbdlType,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'textStyles': instance.textStyles,
      'colorSchemes': instance.colorSchemes?.map((e) => e?.toJson())?.toList(),
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
