import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_star.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLStar implements PBDLNodeFactory, PBDLNode {
  PBDLStar({
    bool edited,
    bool isClosed,
    pointRadiusBehaviour,
    List points,
    this.UUID,
    booleanOperation,
    exportOptions,
    PBDLFrame this.boundaryRectangle,
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
    this.style,
    this.child,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLStar.fromJson(json);
  factory PBDLStar.fromJson(Map<String, dynamic> json) =>
      _$PBDLStarFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLStarToJson(this);

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
  String type = 'star';

  @override
  PBDLNode child;
}
