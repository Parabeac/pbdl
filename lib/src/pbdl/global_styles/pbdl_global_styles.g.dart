// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_global_styles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLGlobalStyles _$PBDLGlobalStylesFromJson(Map<String, dynamic> json) {
  return PBDLGlobalStyles(
    colors: (json['colors'] as List)
            ?.map((e) => e == null
                ? null
                : PBDLGlobalColor.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    textStyles: (json['textStyles'] as List)
            ?.map((e) => e == null
                ? null
                : PBDLGlobalTextStyle.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    themeColors: (json['themeColors'] as List)
            ?.map((e) => e == null
                ? null
                : PBDLGlobalColor.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    themeTextStyles: (json['themeTextStyles'] as List)
            ?.map((e) => e == null
                ? null
                : PBDLGlobalTextStyle.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    designSystem: json['designSystem'] as String ?? 'material',
  )
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
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLGlobalStylesToJson(PBDLGlobalStyles instance) =>
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
      'designSystem': instance.designSystem,
      'colors': instance.colors?.map((e) => e?.toJson())?.toList(),
      'textStyles': instance.textStyles?.map((e) => e?.toJson())?.toList(),
      'themeColors': instance.themeColors?.map((e) => e?.toJson())?.toList(),
      'themeTextStyles':
          instance.themeTextStyles?.map((e) => e?.toJson())?.toList(),
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
