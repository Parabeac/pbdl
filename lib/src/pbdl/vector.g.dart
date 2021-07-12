// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLVector _$VectorFromJson(Map<String, dynamic> json) {
  return PBDLVector(
    name: json['name'] as String,
    type: json['type'] as String,
    layoutAlign: json['layoutAlign'],
    constraints: json['constraints'],
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
    pbdfType: json['pbdfType'] as String,
    style: json['style'] == null
        ? null
        : PBStyle.fromJson(json['style'] as Map<String, dynamic>),
  )
    ..isVisible = json['isVisible'] as bool
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..imageReference = json['imageReference'] as String;
}

Map<String, dynamic> _$VectorToJson(PBDLVector instance) => <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'layoutAlign': instance.layoutAlign,
      'constraints': instance.constraints,
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'fillsList': instance.fillsList,
      'UUID': instance.UUID,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
      'boundaryRectangle': instance.boundaryRectangle,
      'imageReference': instance.imageReference,
    };
