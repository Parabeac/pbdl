// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFrame _$PBDLFrameFromJson(Map<String, dynamic> json) {
  return PBDLFrame(
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
    fixedRadius: json['fixedRadius'] as num,
    background: json['background'] as Map<String, dynamic>,
  )..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLFrameToJson(PBDLFrame instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'constraints': instance.constraints?.toJson(),
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'type': instance.type,
      'fixedRadius': instance.fixedRadius,
      'background': instance.background,
    };
