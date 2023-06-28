// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boolean_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooleanOperation _$BooleanOperationFromJson(Map<String, dynamic> json) =>
    BooleanOperation(
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => FigmaNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      booleanOperation: json['booleanOperation'] as String?,
      absoluteBoundingBox: json['absoluteBoundingBox'] == null
          ? null
          : FigmaRect.fromJson(
              json['absoluteBoundingBox'] as Map<String, dynamic>),
      UUID: json['id'],
      transitionNodeID: json['transitionNodeID'] as String?,
      transitionDuration: json['transitionDuration'],
      transitionEasing: json['transitionEasing'],
      imageReference: json['imageReference'],
    )
      ..name = json['name'] as String?
      ..pluginData = json['pluginData']
      ..sharedPluginData = json['sharedPluginData']
      ..child = json['child'] == null
          ? null
          : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
      ..layoutAlign = json['layoutAlign'] as String?
      ..layoutGrow = json['layoutGrow'] as num?
      ..isVisible = json['visible'] as bool? ?? true
      ..size = json['size']
      ..strokes = json['strokes']
      ..strokeWeight = (json['strokeWeight'] as num?)?.toDouble()
      ..strokeAlign = json['strokeAlign'] as String?
      ..styles = json['styles']
      ..type = json['type'] as String;

Map<String, dynamic> _$BooleanOperationToJson(BooleanOperation instance) =>
    <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'child': instance.child,
      'layoutAlign': instance.layoutAlign,
      'layoutGrow': instance.layoutGrow,
      'visible': instance.isVisible,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'children': instance.children,
      'booleanOperation': instance.booleanOperation,
      'type': instance.type,
      'absoluteBoundingBox': instance.absoluteBoundingBox,
      'imageReference': instance.imageReference,
    };
