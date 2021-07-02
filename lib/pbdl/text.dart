import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import 'abstract_design_node_factory.dart';
import 'design_element.dart';

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
  PBDLNode createPBDLNode(Map<String, dynamic> json) {}

  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   return Text(
  //     UUID: json['id'] as String,
  //     booleanOperation: json['booleanOperation'],
  //     exportOptions: json['exportOptions'],
  //     boundaryRectangle: json['absoluteBoundingBox'] == null
  //         ? null
  //         : Frame.fromJson(json['absoluteBoundingBox'] as Map<String, dynamic>),
  //     isFixedToViewport: json['isFixedToViewport'] as bool,
  //     isFlippedHorizontal: json['isFlippedHorizontal'] as bool,
  //     isFlippedVertical: json['isFlippedVertical'] as bool,
  //     isLocked: json['isLocked'] as bool,
  //     isVisible: json['visible'] as bool,
  //     layerListExpandedType: json['layerListExpandedType'],
  //     name: json['name'] as String,
  //     nameIsFixed: json['nameIsFixed'] as bool,
  //     resizingConstraint: json['resizingConstraint'],
  //     resizingType: json['resizingType'],
  //     rotation: (json['rotation'] as num)?.toDouble(),
  //     sharedStyleID: json['sharedStyleID'],
  //     shouldBreakMaskChain: json['shouldBreakMaskChain'] as bool,
  //     hasClippingMask: json['hasClippingMask'] as bool,
  //     clippingMaskMode: json['clippingMaskMode'] as int,
  //     maintainScrollPosition: json['maintainScrollPosition'] as bool,
  //     attributedString: json['attributedString'] as Map<String, dynamic>,
  //     automaticallyDrawOnUnderlyingPath:
  //         json['automaticallyDrawOnUnderlyingPath'] as bool,
  //     dontSynchroniseWithSymbol: json['dontSynchroniseWithSymbol'] as bool,
  //     lineSpacingBehaviour: json['lineSpacingBehaviour'],
  //     textBehaviour: json['textBehaviour'],
  //     glyphBounds: json['glyphBounds'],
  //     type: json['type'] as String,
  //     pbdfType: json['pbdfType'],
  //     style: json['style'] == null
  //         ? null
  //         : PBStyle.fromPBDF(json['style'] as Map<String, dynamic>),
  //   );
  // }

  @override
  Future<PBDLNode> interpretNode() {
    // Future.value(InjectedContainer(
    //   Point(boundaryRectangle.x + boundaryRectangle.width,
    //       boundaryRectangle.y + boundaryRectangle.height),
    //   Point(boundaryRectangle.x, boundaryRectangle.y),
    //   name,
    //   Uuid().v4(),
    //   currentContext: currentContext,
    // )..addChild(
    //     InheritedText(this, name, currentContext: currentContext),
    //   ));
  }
}
