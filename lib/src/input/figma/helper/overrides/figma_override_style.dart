import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_style.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';

class FigmaOverrideStyle extends FigmaOverrideType {
  @override
  Future<PBDLOverrideProperty> getValue(FigmaNode node) async {
    if (node is! FigmaStyle) {
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
      (node as FigmaStyle).interpretStyle(),
    ));
  }

  @override
  String getPBDLType() => PBDLOverrideStyle.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode node) => node is FigmaStyle;
}
