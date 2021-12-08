// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    name: json['name'],
    isVisible: json['visible'] ?? true,
    type: json['type'],
    pluginData: json['pluginData'],
    sharedPluginData: json['sharedPluginData'],
    strokes: json['strokes'],
    strokeWeight: json['strokeWeight'],
    strokeAlign: json['strokeAlign'],
    cornerRadius: json['cornerRadius'],
    constraints: json['constraints'] == null
        ? null
        : FigmaConstraints.fromJson(
            json['constraints'] as Map<String, dynamic>),
    layoutAlign: json['layoutAlign'],
    size: json['size'],
    horizontalPadding: json['horizontalPadding'],
    verticalPadding: json['verticalPadding'],
    itemSpacing: json['itemSpacing'],
    componentId: json['componentId'] as String,
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : FigmaNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    parameters: json['parameters'] as List,
    backgroundColor: json['backgroundColor'] == null
        ? null
        : FigmaColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
    transitionNodeID: json['transitionNodeID'] as String,
    transitionDuration: json['transitionDuration'] as num,
    transitionEasing: json['transitionEasing'] as String,
  )
    ..UUID = json['id'] as String
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
    ..layoutGrow = json['layoutGrow'] as num
    ..absoluteBoundingBox = json['absoluteBoundingBox'] == null
        ? null
        : FigmaRect.fromJson(
            json['absoluteBoundingBox'] as Map<String, dynamic>)
    ..isFlowHome = json['isFlowHome'] as bool ?? false
    ..fillsList = json['fills'] as List
    ..imageReference = json['imageReference'] as String
    ..overrideValues = (json['overrideValues'] as List)
        ?.map((e) => e == null
            ? null
            : FigmaOverridableValue.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$InstanceToJson(Instance instance) => <String, dynamic>{
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
      'isFlowHome': instance.isFlowHome,
      'fills': instance.fillsList,
      'imageReference': instance.imageReference,
      'type': instance.type,
      'parameters': instance.parameters,
      'componentId': instance.componentId,
      'overrideValues':
          instance.overrideValues?.map((e) => e?.toJson())?.toList(),
    };
