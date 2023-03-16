// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaSlice _$FigmaSliceFromJson(Map<String, dynamic> json) {
  return FigmaSlice(
    name: json['name'] as String,
    type: json['type'] as String,
    pluginData: json['pluginData'],
    sharedPluginData: json['sharedPluginData'],
    layoutAlign: json['layoutAlign'],
    layoutGrow: json['layoutGrow'],
    constraints: json['constraints'] == null
        ? null
        : FigmaConstraints.fromJson(
            json['constraints'] as Map<String, dynamic>),
    absoluteBoundingBox: json['absoluteBoundingBox'] == null
        ? null
        : FigmaRect.fromJson(
            json['absoluteBoundingBox'] as Map<String, dynamic>),
    size: json['size'],
    transitionNodeID: json['transitionNodeID'] as String,
    transitionDuration: json['transitionDuration'] as num,
    transitionEasing: json['transitionEasing'] as String,
    componentPropertyReferences: json['componentPropertyReferences'],
  )
    ..UUID = json['id'] as String
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
    ..isVisible = json['visible'] as bool ?? true;
}

Map<String, dynamic> _$FigmaSliceToJson(FigmaSlice instance) =>
    <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'constraints': instance.constraints,
      'child': instance.child,
      'layoutAlign': instance.layoutAlign,
      'layoutGrow': instance.layoutGrow,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'componentPropertyReferences': instance.componentPropertyReferences,
      'type': instance.type,
      'absoluteBoundingBox': instance.absoluteBoundingBox,
      'size': instance.size,
      'visible': instance.isVisible,
    };
