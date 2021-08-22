import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';

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
          constraints: constraints
        );
}
