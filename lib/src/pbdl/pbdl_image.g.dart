// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLImage _$PBDLImageFromJson(Map<String, dynamic> json) {
  return PBDLImage(
    imageReference: json['imageReference'] as String,
    UUID: json['UUID'],
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'],
    name: json['name'],
    pbdfType: json['pbdfType'] as String,
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLImageToJson(PBDLImage instance) => <String, dynamic>{
      'child': instance.child,
      'style': instance.style,
      'imageReference': instance.imageReference,
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'boundaryRectangle': instance.boundaryRectangle,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'type': instance.type,
    };
