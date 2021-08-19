import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_group_node.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLGroupNode extends PBDLNode implements PBDLNodeFactory {
  List<PBDLNode> children = [];

  PBDLGroupNode({
    bool hasClickThrough,
    groupLayout,
    String UUID,
    booleanOperation,
    exportOptions,
    PBDLFrame boundaryRectangle,
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
  }) : super(UUID, name, isVisible, boundaryRectangle, style, prototypeNodeUUID, constraints: constraints);

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLGroupNode.fromJson(json);
  factory PBDLGroupNode.fromJson(Map<String, dynamic> json) =>
      _$PBDLGroupNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLGroupNodeToJson(this);

  @override
  String type = 'group';

  @override
  @JsonKey(ignore: true)
  PBDLNode child;
}
