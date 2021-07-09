import 'package:pbdl/src/pbdl/pb_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_design_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'star.g.dart';

@JsonSerializable()
class Star implements PBDLNodeFactory, PBDLNode {
  @override
  String pbdfType = 'star';

  Star({
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
    type,
    pbdfType,
    this.style,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => Star.fromJson(json);
  factory Star.fromJson(Map<String, dynamic> json) => _$StarFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StarToJson(this);

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
  PBStyle style;

  @override
  String type;
}
