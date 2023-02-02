// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_global_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLGlobalImage _$PBDLGlobalImageFromJson(Map<String, dynamic> json) {
  return PBDLGlobalImage(
    json['UUID'] as String,
    json['name'] as String,
    json['image'] == null
        ? null
        : PBDLFill.fromJson(json['image'] as Map<String, dynamic>),
    description: json['description'] as String ?? '',
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
    ..pbdlType = json['pbdlType'] as String
    ..colorScheme = json['colorScheme'] as String;
}

Map<String, dynamic> _$PBDLGlobalImageToJson(PBDLGlobalImage instance) {
  final val = <String, dynamic>{
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
    'description': instance.description,
    'pbdlType': instance.pbdlType,
    'image': instance.image?.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('colorScheme', instance.colorScheme);
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
