// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLPage _$PBDLPageFromJson(Map<String, dynamic> json) {
  return PBDLPage(
    name: json['name'] as String,
    id: json['id'] as String,
  )
    ..imageURI = json['imageURI'] as String
    ..convert = json['convert'] as bool
    ..screens = (json['screens'] as List)
        ?.map((e) =>
            e == null ? null : PBDLScreen.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..pbdfType = json['pbdfType'] as String;
}

Map<String, dynamic> _$PBDLPageToJson(PBDLPage instance) => <String, dynamic>{
      'id': instance.id,
      'imageURI': instance.imageURI,
      'name': instance.name,
      'convert': instance.convert,
      'screens': instance.screens,
      'pbdfType': instance.pbdfType,
    };
