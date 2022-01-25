// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLImage _$PBDLImageFromJson(Map<String, dynamic> json) {
  return PBDLImage(
    imageReference: json['imageReference'] as String,
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLImageToJson(PBDLImage instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'style': instance.style?.toJson(),
      'imageReference': instance.imageReference,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'pbdlType': instance.pbdlType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
