import 'package:pbdl/src/input/figma/entities/layers/figma_frame.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/text.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_text_value.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';

class FigmaOverrideTextValue extends FigmaOverrideType {
  @override
  Future<PBDLOverrideProperty> getValue(FigmaNode node) {
    if (node is! FigmaText) {
      return null;
    }
    return Future.value(PBDLOverrideProperty(
        node.UUID,
        node.name,
        node.isVisible,
        ((node as FigmaText).boundaryRectangle as FigmaFrame).interpretNode(),
        getPBDLType(),
        (node as FigmaText).style.interpretStyle(),
        null,
        (node as FigmaText).content));
  }

  @override
  String getPBDLType() => PBDLOverrideTextValue.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode node) => node is FigmaText;
}
