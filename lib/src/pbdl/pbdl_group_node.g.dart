// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_group_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLGroupNode _$PBDLGroupNodeFromJson(Map<String, dynamic> json) {
  return PBDLGroupNode(
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
  )
    ..designUUID = json['designUUID'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLGroupNodeToJson(PBDLGroupNode instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'designUUID': instance.designUUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'constraints': instance.constraints?.toJson(),
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'type': instance.type,
    };
