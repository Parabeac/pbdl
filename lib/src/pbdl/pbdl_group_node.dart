import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_group_node.g.dart';

@JsonSerializable(explicitToJson: true)

/// This is essentially a folder used to organize the [PBDLNodes] inside. This tends to
/// provide no value, unless it comes with extra metadata that could interpret this group into
/// other usefull objects.
class PBDLGroupNode extends PBDLNode implements PBDLNodeFactory {
  List<PBDLNode> children = [];

  PBDLGroupNode({
    bool hasClickThrough,
    groupLayout,
    String UUID,
    booleanOperation,
    exportOptions,
    PBDLBoundaryBox boundaryRectangle,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    bool isVisible,
    layerListExpandedType,
    String name,
    nameIsFixed,
    PBDLConstraints constraints,
    resizingType,
    rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    maintainScrollPosition,
    PBDLStyle style,
    this.children,
    String prototypeNodeUUID,
    layoutMainAxisSizing,
    layoutCrossAxisSizing,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          style,
          prototypeNodeUUID,
          constraints: constraints,
          layoutMainAxisSizing: layoutMainAxisSizing,
          layoutCrossAxisSizing: layoutCrossAxisSizing,
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLGroupNode.fromJson(json);
  factory PBDLGroupNode.fromJson(Map<String, dynamic> json) =>
      _$PBDLGroupNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLGroupNodeToJson(this);

  @override
  String pbdlType = 'group';

  @override
  @JsonKey(ignore: true)
  PBDLNode child;

  @override
  void sortByUUID() {
    /// Sort `children` within this [PBDLGroupNode]
    children.sort();

    /// Make each `child` sort its own children, if applicable
    children.forEach((child) => child.sortByUUID());
  }
}
