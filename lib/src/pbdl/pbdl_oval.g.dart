// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_oval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLOval _$PBDLOvalFromJson(Map<String, dynamic> json) {
  return PBDLOval(
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    child: json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>),
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
  )..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLOvalToJson(PBDLOval instance) => <String, dynamic>{
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'UUID': instance.UUID,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style?.toJson(),
      'type': instance.type,
      'child': instance.child?.toJson(),
    };
