
import 'package:pbdl/design_logic/pbdl_node.dart';
import 'package:pbdl/input/sketch/entities/abstract_sketch_node_factory.dart';
import 'package:pbdl/input/sketch/entities/layers/abstract_layer.dart';
import 'package:pbdl/input/sketch/entities/layers/abstract_shape_layer.dart';
import 'package:pbdl/input/sketch/entities/layers/flow.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:pbdl/input/sketch/entities/style/style.dart';
import 'package:pbdl/input/sketch/helper/sketch_asset_processor.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

part 'shape_path.g.dart';

// title: Shape Path Layer
// description: Shape path layers are the result of adding a vector layer
@JsonSerializable(nullable: true)
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
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      ShapePath.fromJson(json);
  factory ShapePath.fromJson(Map<String, dynamic> json) =>
      _$ShapePathFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ShapePathToJson(this);

  @override
  Future<PBDLNode> interpretNode() async { /*
    var image = await SketchAssetProcessor()
        .processImage(UUID, boundaryRectangle.width, boundaryRectangle.height);

    return Future.value(InheritedShapePath(this, name,
        currentContext: currentContext, image: image)); */
  }

  @override
  Map<String, dynamic> toPBDF() => <String, dynamic>{
        'booleanOperation': booleanOperation,
        'exportOptions': exportOptions,
        'flow': flow,
        'isFixedToViewport': isFixedToViewport,
        'isFlippedHorizontal': isFlippedHorizontal,
        'isFlippedVertical': isFlippedVertical,
        'isLocked': isLocked,
        'layerListExpandedType': layerListExpandedType,
        'name': name,
        'nameIsFixed': nameIsFixed,
        'resizingConstraint': resizingConstraint,
        'resizingType': resizingType,
        'rotation': rotation,
        'sharedStyleID': sharedStyleID,
        'shouldBreakMaskChain': shouldBreakMaskChain,
        'hasClippingMask': hasClippingMask,
        'clippingMaskMode': clippingMaskMode,
        'userInfo': userInfo,
        'maintainScrollPosition': maintainScrollPosition,
        'prototypeNodeUUID': prototypeNodeUUID,
        'edited': edited,
        'isClosed': isClosed,
        'pointRadiusBehaviour': pointRadiusBehaviour,
        'points': points,
        'CLASS_NAME': CLASS_NAME,
        'absoluteBoundingBox': boundaryRectangle,
        'id': UUID,
        'type': type,
        'visible': isVisible,
        'style': style,
        'pbdfType': pbdfType,
      };

  @override
  @JsonKey(ignore: true)
  String pbdfType = 'vector';
}
