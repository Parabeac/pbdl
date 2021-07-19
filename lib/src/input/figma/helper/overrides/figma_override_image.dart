import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/vector.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_image.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

class FigmaOverrideImage extends FigmaOverrideType {
  @override
  Future<String> getValue(FigmaNode node) {
    if (!matches(node)) {
      return null;
    }
    return Future.value((node as FigmaVector).imageReference);
  }

  @override
  String getPBDLType() => PBDLOverrideImage.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode node) => node is FigmaVector;

  @override
  PBDLStyle getPBDLStyle(FigmaNode node) {
    if (!matches(node)) {
      return null;
    }
    return (node as FigmaVector).style?.interpretStyle();
  }
}
