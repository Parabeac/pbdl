// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaPage _$FigmaPageFromJson(Map<String, dynamic> json) {
  return FigmaPage(
    name: json['name'] as String,
    id: json['id'] as String,
  )
    ..imageURI = json['imageURI'] as String
    ..convert = json['convert'] as bool
    ..screens = (json['screens'] as List)
        ?.map((e) =>
            e == null ? null : FigmaScreen.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..pbdfType = json['pbdfType'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$FigmaPageToJson(FigmaPage instance) => <String, dynamic>{
      'id': instance.id,
      'imageURI': instance.imageURI,
      'name': instance.name,
      'convert': instance.convert,
      'screens': instance.screens,
      'pbdfType': instance.pbdfType,
      'type': instance.type,
    };
