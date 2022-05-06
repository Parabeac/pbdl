import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';

/// FigmaRule is an abstrac class for all rules
/// to be verify that all FigmaNodes pass all rules
abstract class FigmaRule {
  String name;
  String description;
  String details;

  bool validateRule(List<FigmaNode> nodes);
  void executeAction();
}
