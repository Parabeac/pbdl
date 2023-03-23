// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLPage _$PBDLPageFromJson(Map<String, dynamic> json) {
  return PBDLPage(
    name: json['name'] as String,
    UUID: json['UUID'] as String,
    screens: (json['screens'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
    masterPropertyReferences: json['masterPropertyReferences'] == null
        ? null
        : MasterPropertyReference.fromJson(
            json['masterPropertyReferences'] as Map<String, dynamic>),
  )
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
    ..imageURI = json['imageURI'] as String
    ..convert = json['convert'] as bool
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLPageToJson(PBDLPage instance) {
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
  writeNotNull('imageURI', instance.imageURI);
  writeNotNull('convert', instance.convert);
  writeNotNull('screens', instance.screens?.map((e) => e?.toJson())?.toList());
  writeNotNull('pbdlType', instance.pbdlType);
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
