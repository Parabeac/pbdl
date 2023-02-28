import 'package:pbdl/src/pbdl/pbdl_node.dart';

abstract class FigmaRule {
  // to hold the name of the rule being checked
  String name;

  // to hold additional description of the rule if needed.
  String description;

  // Receives a list of nodes and validates the rule
  bool validateRule(List<PBDLNode> nodesList);

  // executes an action that may need to be performed
  // after the rule is evaluated.
  void executeAction();
}
