// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaText _$FigmaTextFromJson(Map<String, dynamic> json) {
  return FigmaText(
    name: json['name'] as String,
    type: json['type'] as String,
    pluginData: json['pluginData'],
    sharedPluginData: json['sharedPluginData'],
    style: json['style'] == null
        ? null
        : FigmaStyle.fromJson(json['style'] as Map<String, dynamic>),
    constraints: json['constraints'] == null
        ? null
        : FigmaConstraints.fromJson(
            json['constraints'] as Map<String, dynamic>),
    size: json['size'],
    strokes: json['strokes'],
    strokeWeight: json['strokeWeight'],
    strokeAlign: json['strokeAlign'],
    styles: json['styles'],
    content: json['characters'] as String,
    characterStyleOverrides: (json['characterStyleOverrides'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
    styleOverrideTable: json['styleOverrideTable'] as Map<String, dynamic>,
    transitionNodeID: json['transitionNodeID'] as String,
    transitionDuration: json['transitionDuration'] as num,
    transitionEasing: json['transitionEasing'] as String,
    layoutAlign: json['layoutAlign'],
    layoutGrow: json['layoutGrow'],
  )
    ..UUID = json['id'] as String
    ..child = json['child'] == null
        ? null
        : FigmaNode.fromJson(json['child'] as Map<String, dynamic>)
    ..isVisible = json['visible'] as bool ?? true
    ..absoluteBoundingBox = json['absoluteBoundingBox'] == null
        ? null
        : FigmaRect.fromJson(
            json['absoluteBoundingBox'] as Map<String, dynamic>)
    ..fillsList = json['fills'] as List
    ..imageReference = json['imageReference'] as String
    ..attributedString = json['attributedString']
    ..automaticallyDrawOnUnderlyingPath =
        json['automaticallyDrawOnUnderlyingPath']
    ..dontSynchroniseWithSymbol = json['dontSynchroniseWithSymbol']
    ..glyphBounds = json['glyphBounds']
    ..lineSpacingBehaviour = json['lineSpacingBehaviour']
    ..textBehaviour = json['textBehaviour'];
}

Map<String, dynamic> _$FigmaTextToJson(FigmaText instance) => <String, dynamic>{
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
      'style': instance.style,
      'absoluteBoundingBox': instance.absoluteBoundingBox,
      'size': instance.size,
      'strokes': instance.strokes,
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'styles': instance.styles,
      'fills': instance.fillsList,
      'imageReference': instance.imageReference,
      'type': instance.type,
      'characters': instance.content,
      'characterStyleOverrides': instance.characterStyleOverrides,
      'styleOverrideTable': instance.styleOverrideTable,
      'attributedString': instance.attributedString,
      'automaticallyDrawOnUnderlyingPath':
          instance.automaticallyDrawOnUnderlyingPath,
      'dontSynchroniseWithSymbol': instance.dontSynchroniseWithSymbol,
      'glyphBounds': instance.glyphBounds,
      'lineSpacingBehaviour': instance.lineSpacingBehaviour,
      'textBehaviour': instance.textBehaviour,
    };
