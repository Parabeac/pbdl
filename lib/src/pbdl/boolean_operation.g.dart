// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boolean_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBooleanOperation _$BooleanOperationFromJson(Map<String, dynamic> json) {
  return PBDLBooleanOperation(
    type: json['type'],
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    UUID: json['UUID'] as String,
    name: json['name'] as String,
    isVisible: json['isVisible'] as bool,
    pbdfType: json['pbdfType'],
  )
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..style = json['style'] == null
        ? null
        : PBStyle.fromJson(json['style'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BooleanOperationToJson(PBDLBooleanOperation instance) =>
    <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'children': instance.children,
      'boundaryRectangle': instance.boundaryRectangle,
      'UUID': instance.UUID,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
      'isVisible': instance.isVisible,
    };
