import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_design_node_factory.dart';
import 'design_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text.g.dart';

@JsonSerializable()
class Text extends DesignElement implements PBDLNodeFactory, PBDLNode {
  var attributedString;

  var automaticallyDrawOnUnderlyingPath;

  var dontSynchroniseWithSymbol;

  var lineSpacingBehaviour;

  var textBehaviour;

  var glyphBounds;

  Text({
    UUID,
    booleanOperation,
    exportOptions,
    PBDLFrame boundaryRectangle,
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
    this.attributedString,
    this.automaticallyDrawOnUnderlyingPath,
    this.dontSynchroniseWithSymbol,
    this.lineSpacingBehaviour,
    this.textBehaviour,
    this.glyphBounds,
    type,
    pbdfType = 'text',
    style,
  }) : super(
          UUID: UUID,
          name: name,
          isVisible: isVisible,
          boundaryRectangle: boundaryRectangle,
          type: type,
          style: style,
        );

  String content;

  @override
  String pbdfType = 'text';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => Text.fromJson(json);
  factory Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TextToJson(this);
}
