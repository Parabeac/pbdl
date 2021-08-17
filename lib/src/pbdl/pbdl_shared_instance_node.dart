import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_value.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_shared_instance_node.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLSharedInstanceNode extends PBDLNode implements PBDLNodeFactory {
  String symbolID;
  List parameters;

  final List<PBDLOverrideValue> overrideValues;

  @override
  final type = 'shared_instance';

  PBDLSharedInstanceNode({
    String UUID,
    this.overrideValues,
    String name,
    bool isVisible,
    PBDLFrame boundaryRectangle,
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
      PBDLSharedInstanceNode.fromJson(json);
  factory PBDLSharedInstanceNode.fromJson(Map<String, dynamic> json) =>
      _$PBDLSharedInstanceNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLSharedInstanceNodeToJson(this);
}
