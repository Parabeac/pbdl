import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/text.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_text_value.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

class FigmaOverrideTextValue extends FigmaOverrideType {
  @override
  Future<String> getValue(FigmaNode node) async {
    if (node is! FigmaText) {
      return null;
    }
    return Future.value((node as FigmaText).content);
  }

  @override
  String getPBDLType() => PBDLOverrideTextValue.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode node) => node is FigmaText;

  @override
  PBDLStyle getPBDLStyle(FigmaNode node) {
    if (!matches(node)) {
      return null;
    }
    return (node as FigmaText).style?.interpretStyle();
  }
}
