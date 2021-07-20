// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLText _$PBDLTextFromJson(Map<String, dynamic> json) {
  return PBDLText(
    UUID: json['UUID'],
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'],
    style: json['style'],
    content: json['content'] as String,
  )
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLTextToJson(PBDLText instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'type': instance.type,
      'content': instance.content,
    };
