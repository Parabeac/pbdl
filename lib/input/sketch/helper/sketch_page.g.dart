// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SketchPage _$SketchPageFromJson(Map<String, dynamic> json) {
  return SketchPage(
    name: json['name'] as String,
    id: json['id'] as String,
  )
    ..imageURI = json['imageURI'] as String
    ..convert = json['convert'] as bool
    ..screens = (json['screens'] as List)
        ?.map((e) =>
            e == null ? null : SketchScreen.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..pbdfType = json['pbdfType'] as String
    ..CLASS_NAME = json['CLASS_NAME'] as String;
}

Map<String, dynamic> _$SketchPageToJson(SketchPage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageURI': instance.imageURI,
      'name': instance.name,
      'convert': instance.convert,
      'screens': instance.screens,
      'pbdfType': instance.pbdfType,
      'CLASS_NAME': instance.CLASS_NAME,
    };
