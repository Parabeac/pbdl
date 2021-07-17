import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_text_style.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_text_style.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';

class FigmaOverrideTextStyle extends FigmaOverrideType {
  @override
  Future<PBDLOverrideProperty> getValue(FigmaNode node) {
    if (node is! FigmaTextStyle) {
      return null;
    }
    return Future.value(PBDLOverrideProperty(
      node.UUID,
      node.name,
      node.isVisible,
      null,
      getPBDLType(),
      null,
      null,
      (node as FigmaTextStyle).interpretTextStyle(),
    ));
  }

  @override
  String getPBDLType() => PBDLOverrideTextStyle.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode node) => node is FigmaTextStyle;
}
