// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Canvas _$CanvasFromJson(Map<String, dynamic> json) {
  return Canvas(
    name: json['name'] as String,
    type: json['type'] as String,
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : FigmaNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    backgroundColor: json['backgroundColor'],
    prototypeStartNodeID: json['prototypeStartNodeID'],
    prototypeDevice: json['prototypeDevice'],
    exportSettings: json['exportSettings'],
    prototypeNodeUUID: json['transitionNodeID'] as String,
    transitionDuration: json['transitionDuration'] as num,
    transitionEasing: json['transitionEasing'] as String,
  )
    ..UUID = json['id'] as String
    ..pluginData = json['pluginData']
    ..sharedPluginData = json['sharedPluginData']
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
    ..isVisible = json['visible'] as bool ?? true
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : FigmaRect.fromJson(json['boundaryRectangle'] as Map<String, dynamic>)
    ..pbdfType = json['pbdfType'] as String;
}

Map<String, dynamic> _$CanvasToJson(Canvas instance) => <String, dynamic>{
      'id': instance.UUID,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'child': instance.child?.toJson(),
      'visible': instance.isVisible,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'type': instance.type,
      'name': instance.name,
      'backgroundColor': instance.backgroundColor,
      'prototypeStartNodeID': instance.prototypeStartNodeID,
      'prototypeDevice': instance.prototypeDevice,
      'exportSettings': instance.exportSettings,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'transitionNodeID': instance.prototypeNodeUUID,
      'pbdfType': instance.pbdfType,
    };
