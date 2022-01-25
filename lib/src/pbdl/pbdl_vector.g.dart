// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_vector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLVector _$PBDLVectorFromJson(Map<String, dynamic> json) {
  return PBDLVector(
    name: json['name'] as String,
    layoutAlign: json['layoutAlign'],
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    size: json['size'],
    strokes: json['strokes'],
    strokeWeight: json['strokeWeight'],
    strokeAlign: json['strokeAlign'],
    styles: json['styles'],
    fillsList: json['fillsList'],
    UUID: json['UUID'] as String,
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    prototypeNodeUUID: json['prototypeNodeUUID'],
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
  )
    ..isVisible = json['isVisible'] as bool
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..pbdlType = json['pbdlType'] as String
    ..imageReference = json['imageReference'] as String
    ..image = json['image'];
}

Map<String, dynamic> _$PBDLVectorToJson(PBDLVector instance) =>
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
      'layoutAlign': instance.layoutAlign,
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'fillsList': instance.fillsList,
      'pbdlType': instance.pbdlType,
      'imageReference': instance.imageReference,
      'image': instance.image,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
