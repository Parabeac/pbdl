// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_artboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLArtboard _$PBDLArtboardFromJson(Map<String, dynamic> json) {
  return PBDLArtboard(
    backgroundColor: json['backgroundColor'] == null
        ? null
        : PBDLColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
    isFlowHome: json['isFlowHome'],
    UUID: json['UUID'],
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'],
    name: json['name'],
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    prototypeNodeUUID: json['prototypeNodeUUID'],
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLArtboardToJson(PBDLArtboard instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'backgroundColor': instance.backgroundColor?.toJson(),
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'isFlowHome': instance.isFlowHome,
      'type': instance.type,
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
    };
