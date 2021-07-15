import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_polygon.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/frame.dart';
import '../style/style.dart';
import 'abstract_shape_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'polygon.g.dart';

// title: Polygon Layer
// description: Polygon layers are the result of adding an polygon shape to the canvas
@JsonSerializable()
class Polygon extends AbstractShapeLayer implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'polygon';
  @override
  @JsonKey(name: 'frame')
  var boundaryRectangle;

  @override
  @JsonKey(name: 'do_objectID')
  String UUID;

  @override
  @JsonKey(name: '_class')
  String type;

  bool _isVisible;

  Style _style;

  @override
  void set isVisible(bool _isVisible) => this._isVisible = _isVisible;

  @override
  bool get isVisible => _isVisible;

  @override
  void set style(_style) => this._style = _style;

  @override
  Style get style => _style;
  Polygon(
      {bool edited,
      bool isClosed,
      pointRadiusBehaviour,
      List points,
      this.UUID,
      booleanOperation,
      exportOptions,
      Frame this.boundaryRectangle,
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
      maintainScrollPosition})
      : _isVisible = isVisible,
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
            maintainScrollPosition);

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) {
    var polygon = Polygon.fromJson(json);
    return polygon;
  }

  factory Polygon.fromJson(Map<String, dynamic> json) =>
      _$PolygonFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PolygonToJson(this);

  @override
  PBDLNode interpretNode() {
    return PBDLPolygon(
      edited: edited,
      isClosed: isClosed,
      pointRadiusBehaviour: pointRadiusBehaviour,
      points: points,
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
      type: type,
      pbdfType: pbdfType,
      style: style.interpretStyle(),
    );

    /*
    var image = await SketchAssetProcessor()
        .processImage(UUID, boundaryRectangle.width, boundaryRectangle.height);

    return Future.value(InheritedPolygon(this, name,
        currentContext: currentContext, image: image)); */
  }

  @override
  @JsonKey(ignore: true)
  String pbdfType = 'polygon';
}
