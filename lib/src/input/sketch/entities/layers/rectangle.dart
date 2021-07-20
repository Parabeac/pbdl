import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_rectangle.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/color.dart';
import '../style/style.dart';
import 'abstract_shape_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'rectangle.g.dart';

// title: Rectangle Layer
// description:
//   Rectangle layers are the result of adding a rectangle shape to the canvas
@JsonSerializable()
class Rectangle extends AbstractShapeLayer
    with PBColorMixin
    implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'rectangle';
  final double fixedRadius;
  final bool hasConvertedToNewRoundCorners;
  final bool needsConvertionToNewRoundCorners;
  @JsonKey(name: 'frame')
  @override
  var boundaryRectangle;
  @override
  @JsonKey(name: 'do_objectID')
  String UUID;

  @override
  @JsonKey(name: '_class')
  String type;

  bool _isVisible;

  Style _style;

  set isVisible(bool _isVisible) => this._isVisible = _isVisible;

  @override
  bool get isVisible => _isVisible;

  set style(_style) => this._style = _style;

  @override
  Style get style => _style;

  Rectangle({
    this.fixedRadius,
    this.hasConvertedToNewRoundCorners,
    this.needsConvertionToNewRoundCorners,
    bool edited,
    bool isClosed,
    pointRadiusBehaviour,
    List points,
    this.UUID,
    booleanOperation,
    exportOptions,
    SketchRect this.boundaryRectangle,
    Flow flow,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    isVisible,
    layerListExpandedType,
    name,
    nameIsFixed,
    resizingConstraint,
    resizingType,
    rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    Style style,
    maintainScrollPosition,
  })  : _isVisible = isVisible,
        _style = style,
        super(
          edited,
          isClosed,
          pointRadiusBehaviour,
          points,
          UUID,
          booleanOperation,
          exportOptions,
          boundaryRectangle,
          flow,
          isFixedToViewport,
          isFlippedHorizontal,
          isFlippedVertical,
          isLocked,
          isVisible,
          layerListExpandedType,
          name,
          nameIsFixed,
          resizingConstraint,
          resizingType,
          rotation,
          sharedStyleID,
          shouldBreakMaskChain,
          hasClippingMask,
          clippingMaskMode,
          userInfo,
          style,
          maintainScrollPosition,
        );
  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      Rectangle.fromJson(json);

  factory Rectangle.fromJson(Map<String, dynamic> json) =>
      _$RectangleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RectangleToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    return Future.value(PBDLRectangle(
        fixedRadius: fixedRadius,
        edited: edited,
        isClosed: isClosed,
        pointRadiusBehaviour: pointRadiusBehaviour,
        UUID: UUID,
        booleanOperation: booleanOperation,
        exportOptions: exportOptions,
        boundaryRectangle: boundaryRectangle.interpretFrame(),
        isFixedToViewport: isFixedToViewport,
        isFlippedHorizontal: isFlippedHorizontal,
        isFlippedVertical: isFlippedVertical,
        isLocked: isLocked,
        isVisible: isVisible,
        layerListExpandedType: layerListExpandedType,
        name: name,
        nameIsFixed: nameIsFixed,
        resizingConstraint: resizingConstraint,
        resizingType: resizingType,
        rotation: rotation,
        sharedStyleID: sharedStyleID,
        shouldBreakMaskChain: shouldBreakMaskChain,
        hasClippingMask: hasClippingMask,
        clippingMaskMode: clippingMaskMode,
        userInfo: userInfo,
        maintainScrollPosition: maintainScrollPosition,
        style: style.interpretStyle(),
        prototypeNodeUUID: flow?.destinationArtboardID));
  }
}
