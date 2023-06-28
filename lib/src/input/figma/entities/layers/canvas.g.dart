// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Canvas _$CanvasFromJson(Map<String, dynamic> json) => Canvas(
      name: json['name'] as String?,
      type: json['type'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => FigmaNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      backgroundColor: json['backgroundColor'],
      prototypeStartNodeID: json['prototypeStartNodeID'],
      prototypeDevice: json['prototypeDevice'],
      exportSettings: json['exportSettings'],
      transitionNodeID: json['transitionNodeID'] as String?,
      transitionDuration: json['transitionDuration'] as num?,
      transitionEasing: json['transitionEasing'] as String?,
      layoutAlign: json['layoutAlign'],
      layoutGrow: json['layoutGrow'],
    )
      ..UUID = json['id'] as String
      ..pluginData = json['pluginData']
      ..sharedPluginData = json['sharedPluginData']
      ..child = json['child'] == null
          ? null
          : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
      ..isVisible = json['visible'] as bool? ?? true
      ..absoluteBoundingBox = json['absoluteBoundingBox'] == null
          ? null
          : FigmaRect.fromJson(
              json['absoluteBoundingBox'] as Map<String, dynamic>);

Map<String, dynamic> _$CanvasToJson(Canvas instance) => <String, dynamic>{
      'id': instance.UUID,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'child': instance.child?.toJson(),
      'layoutAlign': instance.layoutAlign,
      'layoutGrow': instance.layoutGrow,
      'visible': instance.isVisible,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'type': instance.type,
      'name': instance.name,
      'backgroundColor': instance.backgroundColor,
      'prototypeStartNodeID': instance.prototypeStartNodeID,
      'prototypeDevice': instance.prototypeDevice,
      'exportSettings': instance.exportSettings,
      'absoluteBoundingBox': instance.absoluteBoundingBox?.toJson(),
    };
