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

  /// [image] it is in case the Node give us the bytes of the image
  var image;

  /// [imageReference] is when we have the reference to the image instead
  String imageReference;

  PBDLImage({
    this.imageReference,
    UUID,
    booleanOperation,
    exportOptions,
    PBDLFrame boundaryRectangle,
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
    num rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    maintainScrollPosition,
    this.pbdfType = 'image',
    this.style,
    this.image,
  }) : super(
          UUID: UUID,
          name: name,
          isVisible: isVisible,
          boundaryRectangle: boundaryRectangle,
          style: style,
        );

  @override
  String pbdfType = 'image';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLImage.fromJson(json);
  factory PBDLImage.fromJson(Map<String, dynamic> json) =>
      _$PBDLImageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLImageToJson(this);

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
  String type;
}
