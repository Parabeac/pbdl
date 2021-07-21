import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_text_value.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_text.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideTextValue extends SketchOverrideType {
  @override
  final String TYPE_NAME = 'stringValue';

  @override
  Future<String> getValue(SketchNode node) {
    if (node is! SketchText) {
      return Future.value('');
    }
    return Future.value((node as SketchText).content);
  }

  @override
  String getPBDLType() => PBDLOverrideTextValue.PBDL_TYPE_NAME;
}
