import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_polygon.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLPolygon extends PBDLNode implements PBDLNodeFactory {
  PBDLPolygon({
    bool edited,
    bool isClosed,
    pointRadiusBehaviour,
    List points,
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
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLPolygon.fromJson(json);
  factory PBDLPolygon.fromJson(Map<String, dynamic> json) =>
      _$PBDLPolygonFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLPolygonToJson(this);

  @override
  String type = 'polygon';

  @override
  PBDLNode child;
}
