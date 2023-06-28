import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/instance.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_symbol_id.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

class FigmaOverrideSymbolID extends FigmaOverrideType {
  @override
  Future<PBDLNode> getProperty(FigmaNode? node) async {
    if (node is! Instance) {
      return Future.value(null);
    }
    return await node.interpretNode();
  }

  @override
  String getPBDLType() => PBDLOverrideSymbolID.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode? node) => node is Instance;

  @override
  PBDLStyle? getPBDLStyle(FigmaNode node) {
    if (!matches(node)) {
      return null;
    }
    return (node as Instance).figmaStyleProperty?.interpretStyle();
  }

  @override
  Future<String?> getValue(FigmaNode? node) async {
    if (node is Instance) {
      return node.componentId;
    }
    return '';
  }
}
