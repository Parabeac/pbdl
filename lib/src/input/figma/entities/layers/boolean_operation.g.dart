// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boolean_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooleanOperation _$BooleanOperationFromJson(Map<String, dynamic> json) {
  return BooleanOperation(
    children: json['children'],
    booleanOperation: json['booleanOperation'],
    type: json['type'],
    style: json['style'],
    boundaryRectangle: json['absoluteBoundingBox'],
    UUID: json['id'],
    prototypeNodeUUID: json['transitionNodeID'],
    transitionDuration: json['transitionDuration'],
    transitionEasing: json['transitionEasing'],
    imageReference: json['imageReference'],
  )
    ..name = json['name'] as String
    ..pluginData = json['pluginData']
    ..sharedPluginData = json['sharedPluginData']
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
    ..isVisible = json['visible'] as bool ?? true
    ..layoutAlign = json['layoutAlign'] as String
    ..constraints = json['constraints']
    ..size = json['size']
    ..strokes = json['strokes']
    ..strokeWeight = (json['strokeWeight'] as num)?.toDouble()
    ..strokeAlign = json['strokeAlign'] as String
    ..styles = json['styles']
    ..fillsList = json['fills'] as List
    ..pbdfType = json['pbdfType'] as String;
}

Map<String, dynamic> _$BooleanOperationToJson(BooleanOperation instance) =>
    <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'child': instance.child,
      'visible': instance.isVisible,
      'transitionNodeID': instance.prototypeNodeUUID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'style': instance.style,
      'layoutAlign': instance.layoutAlign,
      'constraints': instance.constraints,
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'fills': instance.fillsList,
      'children': instance.children,
      'booleanOperation': instance.booleanOperation,
      'type': instance.type,
      'absoluteBoundingBox': instance.boundaryRectangle,
      'imageReference': instance.imageReference,
      'pbdfType': instance.pbdfType,
    };
