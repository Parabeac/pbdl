import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

import 'abstract_pbdl_node_factory.dart';
import 'pbdl_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_text.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLText extends PBDLElement implements PBDLNodeFactory, PBDLNode {
  @override
  final pbdlType = 'text';

  String content;

  PBDLText({
    UUID,
    booleanOperation,
    exportOptions,
    PBDLBoundaryBox boundaryRectangle,
    bool isFixedToViewport,
    bool isFlippedHorizontal,
    bool isFlippedVertical,
    bool isLocked,
    bool isVisible,
    layerListExpandedType,
    name,
    bool nameIsFixed,
    resizingConstraint,
    resizingType,
    double rotation,
    sharedStyleID,
    bool shouldBreakMaskChain,
    bool hasClippingMask,
    int clippingMaskMode,
    bool maintainScrollPosition,
    PBDLStyle style,
    this.content,
    String prototypeNodeUUID,
    PBDLConstraints constraints,
    layoutMainAxisSizing,
    layoutCrossAxisSizing,
  }) : super(
          UUID: UUID,
          name: name,
          isVisible: isVisible,
          boundaryRectangle: boundaryRectangle,
          style: style,
          prototypeNodeUUID: prototypeNodeUUID,
          constraints: constraints,
          layoutMainAxisSizing: layoutMainAxisSizing,
          layoutCrossAxisSizing: layoutCrossAxisSizing,
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLText.fromJson(json);
  factory PBDLText.fromJson(Map<String, dynamic> json) =>
      _$PBDLTextFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLTextToJson(this);
}
