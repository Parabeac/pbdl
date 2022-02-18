import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_value.dart';
import '../../pbdl.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_shared_instance_node.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLSharedInstanceNode extends PBDLNode implements PBDLNodeFactory {
  String symbolID;
  List parameters;

  final List<PBDLOverrideValue> overrideValues;

  String sharedNodeSetID;

  @override
  final type = 'shared_instance';

  PBDLSharedInstanceNode({
    String UUID,
    this.overrideValues,
    String name,
    bool isVisible,
    PBDLBoundaryBox boundaryRectangle,
    style,
    exportOptions,
    booleanOperation,
    bool isFixedToViewport,
    bool isFlippedVertical,
    bool isFlippedHorizontal,
    bool isLocked,
    layerListExpandedType,
    bool nameIsFixed,
    resizingConstraint,
    resizingType,
    num rotation,
    sharedStyleID,
    bool shouldBreakMaskChain,
    bool hasClippingMask,
    int clippingMaskMode,
    userInfo,
    bool maintainScrollPosition,
    num scale,
    this.symbolID,
    num verticalSpacing,
    num horizontalSpacing,
    String prototypeNodeUUID,
    PBDLConstraints constraints,
    layoutMainAxisSizing,
    layoutCrossAxisSizing,
    this.sharedNodeSetID,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          PBDLStyle.getStyle(style),
          prototypeNodeUUID,
          constraints: constraints,
          layoutMainAxisSizing: layoutMainAxisSizing,
          layoutCrossAxisSizing: layoutCrossAxisSizing,
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLSharedInstanceNode.fromJson(json);
  factory PBDLSharedInstanceNode.fromJson(Map<String, dynamic> json) =>
      _$PBDLSharedInstanceNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLSharedInstanceNodeToJson(this);

  @override
  void sortByUUID() {
    /// Sort [PBDLOverrideValue] by UUID
    overrideValues.sort();

    /// Ensure each `value` sorts its elements
    overrideValues.forEach((value) => value.sortByUUID());
  }
}
