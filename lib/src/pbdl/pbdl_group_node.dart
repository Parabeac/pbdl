import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_group_node.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLGroupNode implements PBDLNodeFactory, PBDLNode {
  List<PBDLNode> children = [];

  PBDLGroupNode({
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
    this.style,
    this.children,
    this.prototypeNodeUUID,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLGroupNode.fromJson(json);
  factory PBDLGroupNode.fromJson(Map<String, dynamic> json) =>
      _$PBDLGroupNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLGroupNodeToJson(this);

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
  PBDLStyle style;

  @override
  String type = 'group_node';

  @override
  @JsonKey(ignore: true)
  PBDLNode child;
}
