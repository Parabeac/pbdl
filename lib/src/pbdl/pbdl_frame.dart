import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_frame.g.dart';

@JsonSerializable(explicitToJson: true)

/// For the [PBDLFrame]s we are mostly sticking to Figmas current definition of a `Frame`. It's as follows:
/// ```text
/// The frame node is a container used to define a layout hierarchy. It is similar to <div> in HTML. It is different from GroupNode, which is closer to a folder for layers.
/// Frames generally have their own size, though the size can be determined by that of its children in the case of auto-layout frames.
/// ```
/// - One important thing to note is that [PBDLFrame] contains [PBDLConstraints], one things that differenciates from [PBDLGroup].
class PBDLFrame extends PBDLNode implements PBDLNodeFactory {
  List<PBDLNode> children = [];
  @override
  String type = 'frame';

  @override
  @JsonKey(ignore: true)
  PBDLNode child;

  PBDLFrame(
      {bool hasClickThrough,
      groupLayout,
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
      PBDLConstraints constraints,
      resizingType,
      rotation,
      sharedStyleID,
      shouldBreakMaskChain,
      hasClippingMask,
      clippingMaskMode,
      userInfo,
      maintainScrollPosition,
      PBDLStyle style,
      this.children,
      String prototypeNodeUUID})
      : super(
            UUID, name, isVisible, boundaryRectangle, style, prototypeNodeUUID,
            constraints: constraints);

  factory PBDLFrame.fromJson(Map<String, dynamic> json) =>
      _$PBDLFrameFromJson(json);
  Map<String, dynamic> toJson() => _$PBDLFrameToJson(this);
}
