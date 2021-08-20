import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_frame.g.dart';

@JsonSerializable(explicitToJson: true)
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
