import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_flow.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_group_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_artboard.g.dart';

@JsonSerializable()
class PBDLArtboard extends PBDLNode implements PBDLGroupNode, PBDLNodeFactory {
  PBDLColor backgroundColor;
  @override
  var boundaryRectangle;
  var isFlowHome;

  var style;
  PBDLArtboard({
    this.backgroundColor,
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
    prototypeNodeUUID,
    type,
    this.style,
    this.children,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          type,
          style,
          prototypeNodeUUID,
        );

  @override
  List children = [];

  @override
  String pbdfType = 'artboard';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLArtboard.fromJson(json);
  factory PBDLArtboard.fromJson(Map<String, dynamic> json) =>
      _$PBDLArtboardFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLArtboardToJson(this);
}
