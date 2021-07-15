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
    ..pbdfType = json['pbdfType'] as String
    ..UUID = json['UUID'] as String
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>)
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..isVisible = json['isVisible'] as bool
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>);
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
      'UUID': instance.UUID,
      'boundaryRectangle': instance.boundaryRectangle,
      'child': instance.child,
      'isVisible': instance.isVisible,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
    };
