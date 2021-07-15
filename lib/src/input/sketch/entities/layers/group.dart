import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_group_node.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/frame.dart';
import '../style/style.dart';
import 'abstract_group_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';
part 'group.g.dart';

@JsonSerializable()
class Group extends AbstractGroupLayer implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'group';
  @override
  @JsonKey(name: 'frame')
  var boundaryRectangle;
  @override
  @JsonKey(name: 'do_objectID')
  String UUID;

  @override
  @JsonKey(name: '_ref')
  String imageReference;

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

  @override
  @JsonKey(name: 'layers')
  List<SketchNode> children;

  Group(
      {bool hasClickThrough,
      groupLayout,
      List<SketchNode> this.children,
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
            hasClickThrough,
            groupLayout,
            children,
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
      _$GroupFromJson(json);
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  PBDLNode interpretNode() {
    return PBDLGroupNode(
      hasClickThrough: hasClickThrough,
      groupLayout: groupLayout,
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
      rotation: rotation,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      hasClippingMask: hasClippingMask,
      clippingMaskMode: clippingMaskMode,
      userInfo: userInfo,
      maintainScrollPosition: maintainScrollPosition,
      pbdfType: pbdfType,
      style: style.interpretStyle(),
      children: children.map((e) => e.interpretNode()).toList(),
    );
    // Future.value(TempGroupLayoutNode(this, currentContext, name,
    //     topLeftCorner: Point(boundaryRectangle.x, boundaryRectangle.y),
    //     bottomRightCorner: Point(boundaryRectangle.x + boundaryRectangle.width,
    //         boundaryRectangle.y + boundaryRectangle.height)));
  }

  @override
  @JsonKey(ignore: true)
  String pbdfType = 'group';
}
