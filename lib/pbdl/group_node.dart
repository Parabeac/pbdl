import 'package:pbdl/pbdl/pb_style.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_node.g.dart';

@JsonSerializable()
class GroupNode implements PBDLNodeFactory, PBDLNode {
  List children = [];

  @override
  String pbdfType = 'group';

  GroupNode({
    bool hasClickThrough,
    groupLayout,
    this.UUID,
    booleanOperation,
    exportOptions,
    PBDLFrame this.boundaryRectangle,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    this.isVisible,
    layerListExpandedType,
    this.name,
    nameIsFixed,
    resizingConstraint,
    resizingType,
    rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    maintainScrollPosition,
    this.pbdfType = 'group',
    this.style,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      GroupNode.fromJson(json);
  factory GroupNode.fromJson(Map<String, dynamic> json) =>
      _$GroupNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GroupNodeToJson(this);

  @override
  String UUID;

  @override
  var boundaryRectangle;

  @override
  bool isVisible;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBStyle style;

  @override
  String type;

  @override
  Future<PBDLNode> interpretNode() {
    // Future.value(TempGroupLayoutNode(this, currentContext, name,
    //     topLeftCorner: Point(boundaryRectangle.x, boundaryRectangle.y),
    //     bottomRightCorner: Point(boundaryRectangle.x + boundaryRectangle.width,
    //         boundaryRectangle.y + boundaryRectangle.height)));
  }
}
