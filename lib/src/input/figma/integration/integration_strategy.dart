import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/helper/figma_page.dart';
import 'package:pbdl/src/input/figma/helper/figma_screen.dart';
import 'package:pbdl/src/input/figma/integration/component_strategy.dart';
import 'package:pbdl/src/input/figma/integration/screen_strategy.dart';
import 'package:pbdl/src/input/figma/integration/theming_strategy.dart';

abstract class IntegrationStrategy {
  IntegrationStrategy();

  /// Function that performs an operation with [node] and
  /// decides whether [node] should be in [page].
  ///
  /// Returns the [FigmaPage] which may contain new screens.
  FigmaPage execute(FigmaNode node, FigmaPage page) {
    if (evaluateRule(node, page)) {
      var resultPage = page.copyWith();
      resultPage.addScreen(FigmaScreen(
        figmaNode: node,
        id: node.UUID,
        name: node.name,
        isVisible: node.isVisible,
      ));
     
    }
    return page;
  }

  bool evaluateRule(FigmaNode node, FigmaPage page);

  factory IntegrationStrategy.fromString(String integrationStrategy) {
    switch (integrationStrategy.toLowerCase()) {
      case 'theming':
        return ThemingStrategy();
      case 'component':
        return ComponentStrategy();
      case 'screen':
        return ScreenStrategy();
      default:
        return ScreenStrategy();
    }
  }
}
