// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_boolean_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBooleanOperation _$PBDLBooleanOperationFromJson(Map<String, dynamic> json) {
  return PBDLBooleanOperation(
    children: json['children'],
    booleanOperation: json['booleanOperation'],
    type: json['type'],
    style: json['style'],
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    UUID: json['UUID'] as String,
    prototypeNodeUUID: json['prototypeNodeUUID'],
    imageReference: json['imageReference'],
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..layoutAlign = json['layoutAlign']
    ..constraints = json['constraints']
    ..size = json['size']
    ..strokes = json['strokes']
    ..strokeWeight = json['strokeWeight']
    ..strokeAlign = json['strokeAlign']
    ..styles = json['styles']
    ..fillsList = json['fillsList']
    ..pbdfType = json['pbdfType'] as String
    ..name = json['name'] as String
    ..isVisible = json['isVisible'] as bool
    ..image = json['image'];
}

Map<String, dynamic> _$PBDLBooleanOperationToJson(
        PBDLBooleanOperation instance) =>
    <String, dynamic>{
      'child': instance.child,
      'layoutAlign': instance.layoutAlign,
      'constraints': instance.constraints,
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'fillsList': instance.fillsList,
      'pbdfType': instance.pbdfType,
      'children': instance.children,
      'booleanOperation': instance.booleanOperation,
      'type': instance.type,
      'boundaryRectangle': instance.boundaryRectangle,
      'imageReference': instance.imageReference,
      'UUID': instance.UUID,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'isVisible': instance.isVisible,
      'image': instance.image,
    };
