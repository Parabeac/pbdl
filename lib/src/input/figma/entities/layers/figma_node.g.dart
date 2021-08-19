// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaNode _$FigmaNodeFromJson(Map<String, dynamic> json) {
  return FigmaNode(
    json['name'] as String,
    json['visible'] as bool ?? true,
    json['type'] as String,
    json['pluginData'],
    json['sharedPluginData'],
    UUID: json['id'] as String,
    transitionNodeID: json['transitionNodeID'] as String,
    transitionDuration: json['transitionDuration'] as num,
    transitionEasing: json['transitionEasing'] as String,
    constraints: json['constraints'] == null
        ? null
        : FigmaConstraints.fromJson(
            json['constraints'] as Map<String, dynamic>),
  )
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : FigmaRect.fromJson(json['boundaryRectangle'] as Map<String, dynamic>)
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FigmaNodeToJson(FigmaNode instance) => <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'type': instance.type,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'boundaryRectangle': instance.boundaryRectangle,
      'constraints': instance.constraints,
      'child': instance.child,
      'visible': instance.isVisible,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
    };
