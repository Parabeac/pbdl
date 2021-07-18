import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_color.dart';
import 'pbdl_frame.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_rectangle.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLRectangle with PBColorMixin implements PBDLNodeFactory, PBDLNode {
  @override
  String pbdfType = 'rectangle';

  var hasConvertedToNewRoundCorners;

  var fixedRadius;

  var needsConvertionToNewRoundCorners;

  var points;

  PBDLRectangle({
    this.fixedRadius,
    this.hasConvertedToNewRoundCorners,
    this.needsConvertionToNewRoundCorners,
    bool edited,
    bool isClosed,
    pointRadiusBehaviour,
    List this.points,
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
    this.pbdfType = 'rectangle',
    this.style,
    this.child,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLRectangle.fromJson(json);
  factory PBDLRectangle.fromJson(Map<String, dynamic> json) =>
      _$PBDLRectangleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLRectangleToJson(this);

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
  String type = 'rectangle';

  @override
  PBDLNode child;
}
