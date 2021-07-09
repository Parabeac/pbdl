// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaScreen _$FigmaScreenFromJson(Map<String, dynamic> json) {
  return FigmaScreen(
    figmaNode: json['figmaNode'] == null
        ? null
        : FigmaNode.fromJson(json['figmaNode'] as Map<String, dynamic>),
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
  )
    ..convert = json['convert'] as bool
    ..imageURI = json['imageURI'] as String
    ..pbdfType = json['pbdfType'] as String;
}

Map<String, dynamic> _$FigmaScreenToJson(FigmaScreen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'convert': instance.convert,
      'imageURI': instance.imageURI,
      'type': instance.type,
      'figmaNode': instance.figmaNode,
      'pbdfType': instance.pbdfType,
    };
