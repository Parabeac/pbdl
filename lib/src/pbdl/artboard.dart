import 'package:pbdl/src/pbdl/color.dart';
import 'package:pbdl/src/pbdl/pb_style.dart';
import 'package:pbdl/src/pbdl/pbdl_flow.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'group_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artboard.g.dart';

@JsonSerializable()
class PBArtboard extends PBDLNode implements GroupNode, PBDLNodeFactory {
  PBColor backgroundColor;
  @override
  var boundaryRectangle;
  var isFlowHome;

  var style;
  PBArtboard(
      {this.backgroundColor,
      this.isFlowHome,
      hasClickThrough,
      groupLayout,
      UUID,
      booleanOperation,
      exportOptions,
      PBDLFrame this.boundaryRectangle,
      PBDLFlow flow,
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
      maintainScrollPosition,
      prototypeNode,
      type,
      this.style})
      : super(UUID, name, isVisible, boundaryRectangle, type, style,
            prototypeNode);

  @override
  List children = [];

  @override
  String pbdfType = 'artboard';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBArtboard.fromJson(json);
  factory PBArtboard.fromJson(Map<String, dynamic> json) =>
      _$PBArtboardFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBArtboardToJson(this);
}
