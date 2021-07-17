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
    String prototypeNodeUUID,
    num transitionDuration,
    String transitionEasing,
    this.children,
  }) : super(
          name,
          isVisible,
          type,
          pluginData,
          sharedPluginData,
          UUID: UUID,
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        );
}
