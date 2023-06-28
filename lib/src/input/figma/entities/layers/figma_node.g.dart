// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaNode _$FigmaNodeFromJson(Map<String, dynamic> json) => FigmaNode(
      json['name'] as String?,
      json['visible'] as bool? ?? true,
      json['type'] as String?,
      json['pluginData'],
      json['sharedPluginData'],
      UUID: json['id'] as String? ?? '',
      transitionNodeID: json['transitionNodeID'] as String?,
      transitionDuration: json['transitionDuration'] as num?,
      transitionEasing: json['transitionEasing'] as String?,
      constraints: json['constraints'] == null
          ? null
          : FigmaConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
      layoutAlign: json['layoutAlign'] as String?,
      layoutGrow: json['layoutGrow'] as num?,
    )
      ..absoluteBoundingBox = json['absoluteBoundingBox'] == null
          ? null
          : FigmaRect.fromJson(
              json['absoluteBoundingBox'] as Map<String, dynamic>)
      ..child = json['child'] == null
          ? null
          : FigmaNode.fromJson(json['child'] as Map<String, dynamic>);

Map<String, dynamic> _$FigmaNodeToJson(FigmaNode instance) => <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'type': instance.type,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'absoluteBoundingBox': instance.absoluteBoundingBox,
      'constraints': instance.constraints,
      'child': instance.child,
      'layoutAlign': instance.layoutAlign,
      'layoutGrow': instance.layoutGrow,
      'visible': instance.isVisible,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
    };
