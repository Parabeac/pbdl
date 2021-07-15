// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SketchNode _$SketchNodeFromJson(Map<String, dynamic> json) {
  return SketchNode(
    json['do_objectID'] as String,
    json['booleanOperation'],
    json['exportOptions'],
    json['frame'] == null
        ? null
        : SketchFrame.fromJson(json['frame'] as Map<String, dynamic>),
    json['flow'] == null
        ? null
        : Flow.fromJson(json['flow'] as Map<String, dynamic>),
    json['isFixedToViewport'] as bool,
    json['isFlippedHorizontal'] as bool,
    json['isFlippedVertical'] as bool,
    json['isLocked'] as bool,
    json['isVisible'] as bool,
    json['layerListExpandedType'],
    json['name'] as String,
    json['nameIsFixed'] as bool,
    json['resizingConstraint'],
    json['resizingType'],
    json['rotation'] as num,
    json['sharedStyleID'],
    json['shouldBreakMaskChain'] as bool,
    json['hasClippingMask'] as bool,
    json['clippingMaskMode'] as int,
    json['userInfo'],
    json['style'] == null
        ? null
        : Style.fromJson(json['style'] as Map<String, dynamic>),
    json['maintainScrollPosition'] as bool,
  )..prototypeNodeUUID = json['prototypeNodeUUID'] as String;
}

Map<String, dynamic> _$SketchNodeToJson(SketchNode instance) =>
    <String, dynamic>{
      'do_objectID': instance.UUID,
      'booleanOperation': instance.booleanOperation,
      'exportOptions': instance.exportOptions,
      'frame': instance.boundaryRectangle,
      'flow': instance.flow,
      'isFixedToViewport': instance.isFixedToViewport,
      'isFlippedHorizontal': instance.isFlippedHorizontal,
      'isFlippedVertical': instance.isFlippedVertical,
      'isLocked': instance.isLocked,
      'isVisible': instance.isVisible,
      'layerListExpandedType': instance.layerListExpandedType,
      'name': instance.name,
      'nameIsFixed': instance.nameIsFixed,
      'resizingConstraint': instance.resizingConstraint,
      'resizingType': instance.resizingType,
      'rotation': instance.rotation,
      'sharedStyleID': instance.sharedStyleID,
      'shouldBreakMaskChain': instance.shouldBreakMaskChain,
      'hasClippingMask': instance.hasClippingMask,
      'clippingMaskMode': instance.clippingMaskMode,
      'userInfo': instance.userInfo,
      'style': instance.style,
      'maintainScrollPosition': instance.maintainScrollPosition,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
    };
