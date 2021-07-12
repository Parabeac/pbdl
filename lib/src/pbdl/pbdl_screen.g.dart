// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLScreen _$PBDLScreenFromJson(Map<String, dynamic> json) {
  return PBDLScreen(
    designNode: json['designNode'] == null
        ? null
        : PBDLNode.fromJson(json['designNode'] as Map<String, dynamic>),
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
  )
    ..convert = json['convert'] as bool
    ..imageURI = json['imageURI'] as String
    ..pbdfType = json['pbdfType'] as String;
}

Map<String, dynamic> _$PBDLScreenToJson(PBDLScreen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'convert': instance.convert,
      'imageURI': instance.imageURI,
      'type': instance.type,
      'designNode': instance.designNode,
      'pbdfType': instance.pbdfType,
    };
