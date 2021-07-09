// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SketchScreen _$SketchScreenFromJson(Map<String, dynamic> json) {
  return SketchScreen(
    designNode: json['designNode'] == null
        ? null
        : SketchNode.fromJson(json['designNode'] as Map<String, dynamic>),
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
  )
    ..convert = json['convert'] as bool
    ..imageURI = json['imageURI'] as String
    ..pbdfType = json['pbdfType'] as String
    ..CLASS_NAME = json['CLASS_NAME'] as String;
}

Map<String, dynamic> _$SketchScreenToJson(SketchScreen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'convert': instance.convert,
      'imageURI': instance.imageURI,
      'type': instance.type,
      'designNode': instance.designNode,
      'pbdfType': instance.pbdfType,
      'CLASS_NAME': instance.CLASS_NAME,
    };
