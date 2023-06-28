import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_flow.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_group_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_artboard.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLArtboard extends PBDLNode implements PBDLGroupNode, PBDLNodeFactory {
  PBDLColor? backgroundColor;
  @override
  PBDLBoundaryBox? boundaryRectangle;
  var isFlowHome;

  @override
  final pbdlType = 'artboard';

  PBDLArtboard({
    this.backgroundColor,
    this.isFlowHome,
    hasClickThrough,
    groupLayout,
    UUID = '',
    booleanOperation,
    exportOptions,
    this.boundaryRectangle,
    PBDLFlow? flow,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    isVisible,
    layerListExpandedType,
    name,
    nameIsFixed,
    PBDLConstraints? constraints,
    resizingType,
    rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    maintainScrollPosition,
    prototypeNodeUUID,
    PBDLStyle? style,
    this.children,
    layoutMainAxisSizing,
    layoutCrossAxisSizing,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          style,
          prototypeNodeUUID,
          layoutMainAxisSizing: layoutMainAxisSizing,
          layoutCrossAxisSizing: layoutCrossAxisSizing,
        ) {}

  @override
  List<PBDLNode?>? children = [];

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLArtboard.fromJson(json);
  factory PBDLArtboard.fromJson(Map<String, dynamic> json) =>
      _$PBDLArtboardFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLArtboardToJson(this);
}
