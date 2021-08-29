// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLNode _$PBDLNodeFromJson(Map<String, dynamic> json) {
  return PBDLNode(
    json['UUID'] as String,
    json['name'] as String,
    json['isVisible'] as bool,
    json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    json['prototypeNodeUUID'] as String,
    child: json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>),
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
  )
    ..designUUID = json['designUUID'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLNodeToJson(PBDLNode instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'designUUID': instance.designUUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'type': instance.type,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
    };
