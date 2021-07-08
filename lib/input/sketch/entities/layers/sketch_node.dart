import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import '../abstract_sketch_node_factory.dart';
import '../objects/frame.dart';
import '../style/style.dart';
import 'flow.dart';

part 'sketch_node.g.dart';

@JsonSerializable(nullable: true)
// title: Abstract Layer
// description: Abstract base schema for all layers
// type: object
class SketchNode {
  @override
  @JsonKey(name: 'do_objectID')
  final String UUID;
  final dynamic booleanOperation;
  final dynamic exportOptions;

  ///`boundaryRectangle` is not final because its going to change, just because some node contain an offset.
  @override
  @JsonKey(name: 'frame')
  var boundaryRectangle;
  Flow flow;
  final bool isFixedToViewport;
  final bool isFlippedHorizontal;
  final bool isFlippedVertical;
  final bool isLocked;
  final bool isVisible;
  final dynamic layerListExpandedType;
  String name;
  final bool nameIsFixed;
  final dynamic resizingConstraint;
  final dynamic resizingType;
  final num rotation;
  final dynamic sharedStyleID;
  final bool shouldBreakMaskChain;
  final bool hasClippingMask;
  final int clippingMaskMode;
  final dynamic userInfo;
  final Style style;
  final bool maintainScrollPosition;

  @override
  set prototypeNodeUUID(String id) => flow?.destinationArtboardID ??= id;
  @override
  String get prototypeNodeUUID => flow?.destinationArtboardID;

  SketchNode(
      this.UUID,
      this.booleanOperation,
      this.exportOptions,
      Frame this.boundaryRectangle,
      Flow this.flow,
      this.isFixedToViewport,
      this.isFlippedHorizontal,
      this.isFlippedVertical,
      this.isLocked,
      this.isVisible,
      this.layerListExpandedType,
      this.name,
      this.nameIsFixed,
      this.resizingConstraint,
      this.resizingType,
      this.rotation,
      this.sharedStyleID,
      this.shouldBreakMaskChain,
      this.hasClippingMask,
      this.clippingMaskMode,
      this.userInfo,
      this.style,
      this.maintainScrollPosition);

  Future<PBDLNode> interpretNode() {}

  factory SketchNode.fromJson(Map<String, dynamic> json) =>
      _$SketchNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SketchNodeToJson(this);
}
