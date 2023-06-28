import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style_property.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_style.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

class FigmaOverrideStyle extends FigmaOverrideType {
  @override
  Future<PBDLStyle?> getProperty(FigmaNode? node) async {
    if (node is! FigmaStyleProperty) {
      return null;
    }
    return Future.value((node as FigmaStyleProperty).interpretStyle());
  }

  @override
  String getPBDLType() => PBDLOverrideStyle.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode? node) => node is FigmaStyleProperty;

  @override
  PBDLStyle? getPBDLStyle(FigmaNode node) => null;

  @override
  Future<String> getValue(FigmaNode? node) async {
    return '';
  }
}
