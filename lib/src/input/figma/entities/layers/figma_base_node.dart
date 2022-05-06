import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/util/figma/rules/figma_rule.dart';

abstract class FigmaBaseNode {
  String type;
  Set<FigmaRule> rules;
  Future<PBDLNode> interpretNode();

  void addRule(FigmaRule rule);
  void removeRule(FigmaRule rule);
  void checkRules();
  FigmaNode createFigmaNode(Map<String, dynamic> json);
}
