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
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
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
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..type = json['type'] as String
    ..isVisible = json['isVisible'] as bool
    ..imageReference = json['imageReference'] as String
    ..image = json['image'];
}

Map<String, dynamic> _$PBDLVectorToJson(PBDLVector instance) =>
    <String, dynamic>{
      'child': instance.child?.toJson(),
      'layoutAlign': instance.layoutAlign,
      'constraints': instance.constraints?.toJson(),
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'fillsList': instance.fillsList,
      'type': instance.type,
      'UUID': instance.UUID,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style?.toJson(),
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'imageReference': instance.imageReference,
      'image': instance.image,
    };
