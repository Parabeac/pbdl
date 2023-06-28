// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_color_scheme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialColorScheme _$MaterialColorSchemeFromJson(Map<String, dynamic> json) =>
    MaterialColorScheme(
      json['name'] as String,
    )
      ..UUID = json['UUID'] as String
      ..layoutMainAxisSizing = PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?)
      ..layoutCrossAxisSizing = PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?)
      ..isVisible = json['isVisible'] as bool?
      ..boundaryRectangle = json['boundaryRectangle'] == null
          ? null
          : PBDLBoundaryBox.fromJson(
              json['boundaryRectangle'] as Map<String, dynamic>)
      ..pbdlType = json['pbdlType'] as String?
      ..style = json['style'] == null
          ? null
          : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
      ..prototypeNodeUUID = json['prototypeNodeUUID'] as String?
      ..child = json['child'] == null
          ? null
          : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
      ..constraints = json['constraints'] == null
          ? null
          : PBDLConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>)
      ..supportedAttributes = (json['supportedAttributes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet();

Map<String, dynamic> _$MaterialColorSchemeToJson(
        MaterialColorScheme instance) =>
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
      'supportedAttributes': instance.supportedAttributes?.toList(),
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
