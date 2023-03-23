import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/helper/properties/references/figma_component_property_reference.dart';

class FigmaChildrenNode extends FigmaNode {
  List<FigmaNode> children;

  FigmaChildrenNode(
    String name,
    bool isVisible,
    String type,
    pluginData,
    sharedPluginData, {
    String UUID,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
    FigmaConstraints constraints,
    this.children,
    layoutAlign,
    layoutGrow,
    ComponentPropertyReference componentPropertyReferences,
  }) : super(
          name,
          isVisible,
          type,
          pluginData,
          sharedPluginData,
          UUID: UUID,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
          constraints: constraints,
          layoutAlign: layoutAlign,
          layoutGrow: layoutGrow,
          componentPropertyReferences: componentPropertyReferences,
        ) {
    // Remove elements that are [null], which are unsupported nodes
    children?.removeWhere((element) => element == null);
    for (var i = 0; i < (children?.length ?? 0); i++) {
      children[i]?.absoluteBoundingBox?.z = i * 1.0;
    }
  }
}
