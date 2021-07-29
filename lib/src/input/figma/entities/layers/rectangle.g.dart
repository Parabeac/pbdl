// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rectangle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaRectangle _$FigmaRectangleFromJson(Map<String, dynamic> json) {
  return FigmaRectangle(
    name: json['name'] as String,
    isVisible: json['visible'] as bool ?? true,
    type: json['type'],
    pluginData: json['pluginData'],
    sharedPluginData: json['sharedPluginData'],
    layoutAlign: json['layoutAlign'],
    constraints: json['constraints'],
    boundaryRectangle: json['absoluteBoundingBox'],
    size: json['size'],
    strokes: json['strokes'],
    strokeWeight: json['strokeWeight'],
    strokeAlign: json['strokeAlign'],
    styles: json['styles'],
    cornerRadius: (json['cornerRadius'] as num)?.toDouble(),
    rectangleCornerRadii: (json['rectangleCornerRadii'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    points: json['points'] as List,
    fillsList: json['fills'] as List,
    transitionNodeID: json['transitionNodeID'] as String,
    transitionDuration: json['transitionDuration'] as num,
    transitionEasing: json['transitionEasing'] as String,
  )
    ..UUID = json['id'] as String
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
    ..imageReference = json['imageReference'] as String;
}

Map<String, dynamic> _$FigmaRectangleToJson(FigmaRectangle instance) =>
    <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'child': instance.child,
      'visible': instance.isVisible,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'layoutAlign': instance.layoutAlign,
      'constraints': instance.constraints,
      'absoluteBoundingBox': instance.boundaryRectangle,
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'fills': instance.fillsList,
      'imageReference': instance.imageReference,
      'type': instance.type,
      'points': instance.points,
      'cornerRadius': instance.cornerRadius,
      'rectangleCornerRadii': instance.rectangleCornerRadii,
    };
