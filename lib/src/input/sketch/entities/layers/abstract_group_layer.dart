import '../objects/sketch_frame.dart';
import '../style/style.dart';
import 'sketch_node.dart';
import 'flow.dart';

abstract class AbstractGroupLayer extends SketchNode {
  final bool hasClickThrough;
  final dynamic groupLayout;
  @override
  final List<SketchNode> children;

  AbstractGroupLayer(
      this.hasClickThrough,
      this.groupLayout,
      this.children,
      UUID,
      booleanOperation,
      exportOptions,
      boundaryRectangle,
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

  List<Map> getChildren() {
    List<Map> result = [];
    for (var child in children) {
      // result.add((child as DesignNode).toPBDF()); // TODO: Uncomment this code
    }
    return result;
  }
}
