// title: Abstract Shape Layer
// description: Abstract base layer for all shape layers

import '../objects/sketch_frame.dart';
import '../style/style.dart';
import 'sketch_node.dart';
import 'flow.dart';

abstract class AbstractShapeLayer extends SketchNode {
  final bool edited;
  final bool isClosed;
  final dynamic pointRadiusBehaviour;
  final List points;

  AbstractShapeLayer(
      this.edited,
      this.isClosed,
      this.pointRadiusBehaviour,
      this.points,
      UUID,
      booleanOperation,
      exportOptions,
      SketchFrame boundaryRectangle,
      Flow flow,
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
      Style style,
      maintainScrollPosition)
      : super(
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
            rotation?.toDouble(),
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition);
  @override
  Map<String, dynamic> toJson();
}
