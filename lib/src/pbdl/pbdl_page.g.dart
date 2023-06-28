// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLPage _$PBDLPageFromJson(Map<String, dynamic> json) => PBDLPage(
      name: json['name'] as String?,
      UUID: json['UUID'] as String? ?? '',
      screens: (json['screens'] as List<dynamic>?)
          ?.map((e) => PBDLNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      layoutMainAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?),
      layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?),
    )
      ..isVisible = json['isVisible'] as bool?
      ..boundaryRectangle = json['boundaryRectangle'] == null
          ? null
          : PBDLBoundaryBox.fromJson(
              json['boundaryRectangle'] as Map<String, dynamic>)
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
      ..imageURI = json['imageURI'] as String?
      ..convert = json['convert'] as bool?
      ..pbdlType = json['pbdlType'] as String?;

Map<String, dynamic> _$PBDLPageToJson(PBDLPage instance) {
  final val = <String, dynamic>{
    'UUID': instance.UUID,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
  writeNotNull('imageURI', instance.imageURI);
  writeNotNull('convert', instance.convert);
  writeNotNull('screens', instance.screens?.map((e) => e.toJson()).toList());
  writeNotNull('pbdlType', instance.pbdlType);
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
