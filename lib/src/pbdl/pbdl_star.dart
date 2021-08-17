import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_star.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLStar extends PBDLNode implements PBDLNodeFactory {
  PBDLStar({
    bool edited,
    bool isClosed,
    pointRadiusBehaviour,
    List points,
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
  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLStar.fromJson(json);
  factory PBDLStar.fromJson(Map<String, dynamic> json) =>
      _$PBDLStarFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLStarToJson(this);

  @override
  String type = 'star';

  @override
  PBDLNode child;
}
