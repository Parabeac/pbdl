// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLProject _$PBDLProjectFromJson(Map<String, dynamic> json) {
  return PBDLProject(
    name: json['name'] as String,
    UUID: json['UUID'] as String,
    pages: (json['pages'] as List)
        ?.map((e) =>
            e == null ? null : PBDLPage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pngPath: json['pngPath'] as String,
    globalStyles: json['globalStyles'] == null
        ? null
        : PBDLGlobalStyles.fromJson(
            json['globalStyles'] as Map<String, dynamic>),
  )
    ..layoutMainAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String)
    ..layoutCrossAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutCrossAxisSizing'] as String)
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
    ..debug = json['debug'] as bool
    ..miscPages = (json['miscPages'] as List)
        ?.map((e) =>
            e == null ? null : PBDLPage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..sharedStyles = (json['sharedStyles'] as List)
        ?.map((e) =>
            e == null ? null : SharedStyle.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLProjectToJson(PBDLProject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UUID', instance.UUID);
  writeNotNull('layoutMainAxisSizing',
      _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing]);
  writeNotNull('layoutCrossAxisSizing',
      _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing]);
  writeNotNull('name', instance.name);
  writeNotNull('isVisible', instance.isVisible);
  writeNotNull('boundaryRectangle', instance.boundaryRectangle?.toJson());
  writeNotNull('style', instance.style?.toJson());
  writeNotNull('prototypeNodeUUID', instance.prototypeNodeUUID);
  writeNotNull('child', instance.child?.toJson());
  writeNotNull('constraints', instance.constraints?.toJson());
  val['debug'] = instance.debug;
  val['pngPath'] = instance.pngPath;
  val['pages'] = instance.pages?.map((e) => e?.toJson())?.toList();
  val['miscPages'] = instance.miscPages?.map((e) => e?.toJson())?.toList();
  val['sharedStyles'] =
      instance.sharedStyles?.map((e) => e?.toJson())?.toList();
  val['globalStyles'] = instance.globalStyles?.toJson();
  val['pbdlType'] = instance.pbdlType;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
