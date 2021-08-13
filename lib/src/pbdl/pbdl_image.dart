import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_image.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLImage extends PBDLElement implements PBDLNodeFactory, PBDLNode {
  @override
  var style;

  /// [imageReference] is when we have the reference to the image instead
  String imageReference;

  @override
  String prototypeNodeUUID;

  PBDLImage(
      {this.imageReference,
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
      num rotation,
      sharedStyleID,
      shouldBreakMaskChain,
      hasClippingMask,
      clippingMaskMode,
      userInfo,
      maintainScrollPosition,
      this.style,
      this.prototypeNodeUUID})
      : super(
          UUID: UUID,
          name: name,
          isVisible: isVisible,
          boundaryRectangle: PBDLFrame.getFrame(boundaryRectangle),
          style: PBDLStyle.getStyle(style),
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLImage.fromJson(json);
  factory PBDLImage.fromJson(Map<String, dynamic> json) =>
      _$PBDLImageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLImageToJson(this);

  @override
  String type = 'image';
}
