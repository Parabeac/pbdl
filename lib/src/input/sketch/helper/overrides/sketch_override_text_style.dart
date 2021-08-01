import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_text_style.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/style/text_style.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideTextStyle extends SketchOverrideType {
  @override
  final String TYPE_NAME = 'textStyle';

  @override
  Future<PBDLTextStyle> getValue(SketchNode node) {
    if (node is! TextStyle) {
      return null;
    }
    return Future.value((node as TextStyle).interpretTextStyle());
  }

  @override
  String getPBDLType() => PBDLOverrideTextStyle.PBDL_TYPE_NAME;
}
