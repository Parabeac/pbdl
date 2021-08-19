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
    UUID: json['UUID'] as String,
    name: json['name'] as String,
  )
    ..isVisible = json['isVisible'] as bool
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>)
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..constraints = json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>)
    ..convert = json['convert'] as bool
    ..imageURI = json['imageURI'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLScreenToJson(PBDLScreen instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'convert': instance.convert,
      'imageURI': instance.imageURI,
      'type': instance.type,
      'designNode': instance.designNode?.toJson(),
    };
