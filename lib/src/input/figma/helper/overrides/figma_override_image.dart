import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/vector.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_image.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';

class FigmaOverrideImage extends FigmaOverrideType {
  @override
  Future<PBDLOverrideProperty> getValue(FigmaNode node) {
    throw UnimplementedError(); // TODO: implement this once we know what images will look like in PBDL
  }

  @override
  String getPBDLType() => PBDLOverrideImage.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode node) => node is FigmaVector;
}
