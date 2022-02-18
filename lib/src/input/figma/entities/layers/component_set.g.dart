// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaComponentSet _$FigmaComponentSetFromJson(Map<String, dynamic> json) {
  return FigmaComponentSet(
    name: json['name'] as String,
    isVisible: json['visible'] as bool ?? true,
    type: json['type'] as String,
    pluginData: json['pluginData'],
    sharedPluginData: json['sharedPluginData'],
  )
    ..UUID = json['id'] as String
    ..absoluteBoundingBox = json['absoluteBoundingBox'] == null
        ? null
        : FigmaRect.fromJson(
            json['absoluteBoundingBox'] as Map<String, dynamic>)
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
    ..layoutAlign = json['layoutAlign'] as String
    ..layoutGrow = json['layoutGrow'] as num
    ..transitionNodeID = json['transitionNodeID'] as String
    ..transitionDuration = json['transitionDuration'] as num
    ..transitionEasing = json['transitionEasing'] as String
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : FigmaNode.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FigmaComponentSetToJson(FigmaComponentSet instance) =>
    <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'absoluteBoundingBox': instance.absoluteBoundingBox,
      'child': instance.child,
      'layoutAlign': instance.layoutAlign,
      'layoutGrow': instance.layoutGrow,
      'visible': instance.isVisible,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'type': instance.type,
      'children': instance.children,
    };
