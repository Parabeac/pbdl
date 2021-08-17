import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';

import 'package:json_annotation/json_annotation.dart';

part 'pbdl_oval.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLOval extends PBDLNode implements PBDLNodeFactory {
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
    PBDLFrame boundaryRectangle,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    bool isVisible,
    layerListExpandedType,
    String name,
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
    PBDLStyle style,
    this.child,
    String prototypeNodeUUID,
  }): super(UUID, name, isVisible, boundaryRectangle, style, prototypeNodeUUID);

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLOval.fromJson(json);
  factory PBDLOval.fromJson(Map<String, dynamic> json) =>
      _$PBDLOvalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLOvalToJson(this);

  @override
  String type = 'oval';

  @override
  PBDLNode child;
}
