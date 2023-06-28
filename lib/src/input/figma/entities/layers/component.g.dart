// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
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
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => FigmaNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      backgroundColor: json['backgroundColor'] == null
          ? null
          : FigmaColor.fromJson(
              json['backgroundColor'] as Map<String, dynamic>),
      symbolID: json['symbolID'] as String?,
      transitionNodeID: json['transitionNodeID'] as String?,
      transitionDuration: json['transitionDuration'] as num?,
      transitionEasing: json['transitionEasing'] as String?,
      componentSetId: json['componentSetId'] as String?,
      componentSetName: json['componentSetName'] as String?,
    )
      ..UUID = json['id'] as String
      ..child = json['child'] == null
          ? null
          : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
      ..layoutGrow = json['layoutGrow'] as num?
      ..absoluteBoundingBox = json['absoluteBoundingBox'] == null
          ? null
          : FigmaRect.fromJson(
              json['absoluteBoundingBox'] as Map<String, dynamic>)
      ..imageReference = json['imageReference'] as String?
      ..isFlowHome = json['isFlowHome'] as bool? ?? false;

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'id': instance.UUID,
      'name': instance.name,
      'pluginData': instance.pluginData,
      'sharedPluginData': instance.sharedPluginData,
      'constraints': instance.constraints,
      'child': instance.child,
      'layoutAlign': instance.layoutAlign,
      'layoutGrow': instance.layoutGrow,
      'visible': instance.isVisible,
      'transitionNodeID': instance.transitionNodeID,
      'transitionDuration': instance.transitionDuration,
      'transitionEasing': instance.transitionEasing,
      'children': instance.children,
      'absoluteBoundingBox': instance.absoluteBoundingBox,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'cornerRadius': instance.cornerRadius,
      'size': instance.size,
      'horizontalPadding': instance.horizontalPadding,
      'verticalPadding': instance.verticalPadding,
      'itemSpacing': instance.itemSpacing,
      'backgroundColor': instance.backgroundColor,
      'imageReference': instance.imageReference,
      'type': instance.type,
      'componentSetId': instance.componentSetId,
      'componentSetName': instance.componentSetName,
      'symbolID': instance.symbolID,
      'isFlowHome': instance.isFlowHome,
    };
