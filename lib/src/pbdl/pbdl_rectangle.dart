import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_color.dart';
import 'pbdl_frame.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_rectangle.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLRectangle extends PBDLNode
    with PBColorMixin
    implements PBDLNodeFactory {
  num fixedRadius;

  PBDLRectangle({
    this.fixedRadius,
    bool edited,
    bool isClosed,
    pointRadiusBehaviour,
    String UUID,
    booleanOperation,
    exportOptions,
    PBDLBoundaryBox boundaryRectangle,
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
    PBDLConstraints constraints,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          style,
          prototypeNodeUUID,
          constraints: constraints,
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLRectangle.fromJson(json);
  factory PBDLRectangle.fromJson(Map<String, dynamic> json) =>
      _$PBDLRectangleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLRectangleToJson(this);

  @override
  String type = 'rectangle';

  @override
  PBDLNode child;
}
