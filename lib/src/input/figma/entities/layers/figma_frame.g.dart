// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaFrame _$FigmaFrameFromJson(Map<String, dynamic> json) {
  return FigmaFrame(
    name: json['name'],
    isVisible: json['visible'] ?? true,
    type: json['type'],
    pluginData: json['pluginData'],
    sharedPluginData: json['sharedPluginData'],
    absoluteBoundingBox: json['absoluteBoundingBox'] == null
        ? null
        : FigmaRect.fromJson(
            json['absoluteBoundingBox'] as Map<String, dynamic>),
    constraints: json['constraints'] == null
        ? null
        : FigmaConstraints.fromJson(
            json['constraints'] as Map<String, dynamic>),
    layoutAlign: json['layoutAlign'],
    layoutGrow: json['layoutGrow'],
    size: json['size'],
    horizontalPadding: (json['horizontalPadding'] as num)?.toDouble(),
    verticalPadding: (json['verticalPadding'] as num)?.toDouble(),
    itemSpacing: (json['itemSpacing'] as num)?.toDouble(),
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : FigmaNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    UUID: json['id'] as String,
    backgroundColor: json['backgroundColor'] == null
        ? null
        : FigmaColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
    transitionNodeID: json['transitionNodeID'] as String,
    transitionDuration: json['transitionDuration'] as num,
    transitionEasing: json['transitionEasing'] as String,
    componentPropertyReferences: json['componentPropertyReferences'] == null
        ? null
        : ComponentPropertyReference.fromJson(
            json['componentPropertyReferences'] as Map<String, dynamic>),
  )
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
    ..strokes = json['strokes']
    ..strokeWeight = (json['strokeWeight'] as num)?.toDouble()
    ..strokeAlign = json['strokeAlign'] as String
    ..cornerRadius = (json['cornerRadius'] as num)?.toDouble()
    ..isFlowHome = json['isFlowHome'] as bool ?? false
    ..imageReference = json['imageReference'] as String;
}

Map<String, dynamic> _$FigmaFrameToJson(FigmaFrame instance) =>
    <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'constraints': instance.constraints?.toJson(),
      'child': instance.child?.toJson(),
      'layoutAlign': instance.layoutAlign,
      'layoutGrow': instance.layoutGrow,
      'visible': instance.isVisible,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'componentPropertyReferences':
          instance.componentPropertyReferences?.toJson(),
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'absoluteBoundingBox': instance.absoluteBoundingBox?.toJson(),
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'cornerRadius': instance.cornerRadius,
      'size': instance.size,
      'horizontalPadding': instance.horizontalPadding,
      'verticalPadding': instance.verticalPadding,
      'itemSpacing': instance.itemSpacing,
      'backgroundColor': instance.backgroundColor?.toJson(),
      'type': instance.type,
      'isFlowHome': instance.isFlowHome,
      'imageReference': instance.imageReference,
    };
