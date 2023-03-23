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
    ..masterPropertyReferences = json['masterPropertyReferences'] == null
        ? null
        : MasterPropertyReference.fromJson(
            json['masterPropertyReferences'] as Map<String, dynamic>)
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

Map<String, dynamic> _$PBDLGlobalStylesToJson(PBDLGlobalStyles instance) {
  final val = <String, dynamic>{
    'UUID': instance.UUID,
    'layoutMainAxisSizing':
        _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
    'layoutCrossAxisSizing':
        _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'masterPropertyReferences', instance.masterPropertyReferences?.toJson());
  val['name'] = instance.name;
  val['isVisible'] = instance.isVisible;
  val['boundaryRectangle'] = instance.boundaryRectangle?.toJson();
  val['style'] = instance.style?.toJson();
  val['prototypeNodeUUID'] = instance.prototypeNodeUUID;
  val['child'] = instance.child?.toJson();
  val['constraints'] = instance.constraints?.toJson();
  val['pbdlType'] = instance.pbdlType;
  val['designSystem'] = instance.designSystem;
  val['colors'] = instance.colors?.map((e) => e?.toJson())?.toList();
  val['textStyles'] = instance.textStyles?.map((e) => e?.toJson())?.toList();
  val['themeColors'] = instance.themeColors?.map((e) => e?.toJson())?.toList();
  val['themeTextStyles'] =
      instance.themeTextStyles?.map((e) => e?.toJson())?.toList();
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
