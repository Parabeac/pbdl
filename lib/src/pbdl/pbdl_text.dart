import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_pbdl_node_factory.dart';
import 'pbdl_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_text.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLText extends PBDLElement implements PBDLNodeFactory, PBDLNode {
  var attributedString;

  var automaticallyDrawOnUnderlyingPath;

  var dontSynchroniseWithSymbol;

  var lineSpacingBehaviour;

  var textBehaviour;

  var glyphBounds;

  PBDLText({
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
  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLText.fromJson(json);
  factory PBDLText.fromJson(Map<String, dynamic> json) =>
      _$PBDLTextFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLTextToJson(this);
}
