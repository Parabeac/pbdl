import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';

import 'package:json_annotation/json_annotation.dart';

part 'pbdl_oval.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLOval implements PBDLNodeFactory, PBDLNode {
  @override
  var boundaryRectangle;

  @override
  var UUID;

  PBDLOval({
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
    this.child,
    this.prototypeNodeUUID,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLOval.fromJson(json);
  factory PBDLOval.fromJson(Map<String, dynamic> json) =>
      _$PBDLOvalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLOvalToJson(this);

  @override
  bool isVisible;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBDLStyle style;

  @override
  String type = 'oval';

  @override
  PBDLNode child;
}
