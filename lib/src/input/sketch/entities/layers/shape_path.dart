import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/sketch/helper/sketch_asset_processor.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/style.dart';
import 'abstract_shape_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'shape_path.g.dart';

// title: Shape Path Layer
// description: Shape path layers are the result of adding a vector layer
@JsonSerializable()
class ShapePath extends AbstractShapeLayer implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'shapePath';

  @override
  @JsonKey(name: 'frame')
  var boundaryRectangle;

  @JsonKey(name: 'do_objectID')
  @override
  var UUID;

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

  ShapePath(
      {bool edited,
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
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      ShapePath.fromJson(json);
  factory ShapePath.fromJson(Map<String, dynamic> json) =>
      _$ShapePathFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ShapePathToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    var image = await SketchAssetProcessor()
        .processImage(UUID, boundaryRectangle.width, boundaryRectangle.height);

    var ref = SketchAssetProcessor.writeImage(name, image);

    return Future.value(PBDLImage(
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
      name: name + '_${SketchAssetProcessor.imageNames[name]}',
      nameIsFixed: nameIsFixed,
      constraints: resizingConstraint,
      rotation: rotation,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      hasClippingMask: hasClippingMask,
      clippingMaskMode: clippingMaskMode,
      userInfo: userInfo,
      maintainScrollPosition: maintainScrollPosition,
      style: style.interpretStyle(),
      imageReference: ref,
      prototypeNodeUUID: flow?.destinationArtboardID,
    ));
/*
    return Future.value(InheritedShapePath(this, name,
        currentContext: currentContext, image: image)); */
  }
}
