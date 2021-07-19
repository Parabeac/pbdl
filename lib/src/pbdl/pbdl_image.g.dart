// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLImage _$PBDLImageFromJson(Map<String, dynamic> json) {
  return PBDLImage(
    imageReference: json['imageReference'] as String,
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
  )
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLImageToJson(PBDLImage instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'style': instance.style?.toJson(),
      'imageReference': instance.imageReference,
      'type': instance.type,
    };
