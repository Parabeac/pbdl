import 'package:pbdl/src/input/figma/entities/layers/component.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/input/figma/helper/figma_page.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/integration/integration_strategy.dart';

class ComponentStrategy extends IntegrationStrategy {
  @override
  bool evaluateRule(FigmaNode node, FigmaPage page) =>
      node is Component || node is GlobalStyleProperty;
}
