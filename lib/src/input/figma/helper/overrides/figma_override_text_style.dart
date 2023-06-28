import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_text_style.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_text_style.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_text_style.dart';

class FigmaOverrideTextStyle extends FigmaOverrideType {
  @override
  Future<PBDLTextStyle>? getProperty(FigmaNode? node) {
    if (node is! FigmaTextStyle) {
      return null;
    }
    return Future.value((node as FigmaTextStyle).interpretTextStyle());
  }

  @override
  String getPBDLType() => PBDLOverrideTextStyle.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode? node) => node is FigmaTextStyle;

  @override
  PBDLStyle? getPBDLStyle(FigmaNode node) => null;

  @override
  Future<String> getValue(FigmaNode? node) async {
    return '';
  }
}
