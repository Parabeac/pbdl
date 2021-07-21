import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_text.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/style.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'sketch_text.g.dart';

// title: Text Layer
// description: A text layer represents a discrete block or line of text
@JsonSerializable()
class SketchText extends SketchNode implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'text';

  final bool automaticallyDrawOnUnderlyingPath;
  final bool dontSynchroniseWithSymbol;
  final dynamic lineSpacingBehaviour;
  final dynamic textBehaviour;
  final dynamic glyphBounds;

  @override
  @JsonKey(name: 'frame')
  var boundaryRectangle;

  @override
  @JsonKey(name: 'do_objectID')
  String UUID;

  @override
  @JsonKey(name: '_class')
  String type;
  bool _isVisible;

  Style _style;

  @override
  void set isVisible(bool _isVisible) => this._isVisible = _isVisible;

  @override
  bool get isVisible => _isVisible;

  @override
  void set style(_style) => this._style = _style;

  @override
  Style get style => _style;

  SketchText(
      {this.UUID,
      booleanOperation,
      exportOptions,
      SketchRect this.boundaryRectangle,
      Flow flow,
      bool isFixedToViewport,
      bool isFlippedHorizontal,
      bool isFlippedVertical,
      bool isLocked,
      bool isVisible,
      layerListExpandedType,
      String name,
      bool nameIsFixed,
      resizingConstraint,
      resizingType,
      double rotation,
      sharedStyleID,
      bool shouldBreakMaskChain,
      bool hasClippingMask,
      int clippingMaskMode,
      userInfo,
      Style style,
      bool maintainScrollPosition,
      this.attributedString,
      this.automaticallyDrawOnUnderlyingPath,
      this.dontSynchroniseWithSymbol,
      this.lineSpacingBehaviour,
      this.textBehaviour,
      this.glyphBounds})
      : _isVisible = isVisible,
        _style = style,
        super(
            UUID,
            booleanOperation,
            exportOptions,
            boundaryRectangle,
            flow,
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
            rotation,
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition) {
    content = attributedString == null ? '' : attributedString['string'];
  }

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      SketchText.fromJson(json);
  factory SketchText.fromJson(Map<String, dynamic> json) =>
      _$SketchTextFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SketchTextToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    return Future.value(PBDLText(
      UUID: UUID,
      booleanOperation: booleanOperation,
      exportOptions: exportOptions,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      isFixedToViewport: isFixedToViewport,
      isFlippedHorizontal: isFlippedHorizontal,
      isFlippedVertical: isFlippedVertical,
      isLocked: isLocked,
      isVisible: isVisible,
      layerListExpandedType: layerListExpandedType,
      name: name,
      nameIsFixed: nameIsFixed,
      resizingConstraint: resizingConstraint,
      resizingType: resizingType,
      rotation: rotation,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      hasClippingMask: hasClippingMask,
      clippingMaskMode: clippingMaskMode,
      maintainScrollPosition: maintainScrollPosition,
      style: style.interpretStyle(),
      content: content,
      prototypeNodeUUID: flow?.destinationArtboardID,
    ));
  }

  @JsonKey(ignore: true)
  String content;

  var attributedString;

  set automaticallyDrawOnUnderlyingPath(_automaticallyDrawOnUnderlyingPath) {
    // TODO: implement automaticallyDrawOnUnderlyingPath
  }

  set dontSynchroniseWithSymbol(_dontSynchroniseWithSymbol) {
    // TODO: implement dontSynchroniseWithSymbol
  }

  set glyphBounds(_glyphBounds) {
    // TODO: implement glyphBounds
  }

  set lineSpacingBehaviour(_lineSpacingBehaviour) {
    // TODO: implement lineSpacingBehaviour
  }

  set textBehaviour(_textBehaviour) {
    // TODO: implement textBehaviour
  }
}
