import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_text_value.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_text.dart';
import 'package:pbdl/src/input/sketch/entities/objects/override_value.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';
import 'package:pbdl/src/pbdl/pbdl_nodes_export.dart';

class SketchOverrideTextValue extends SketchOverrideType {
  @override
  final String TYPE_NAME = 'stringValue';

  @override
  Future<PBDLText> getProperty(SketchNode node) async {
    if (node is! SketchText) {
      return null;
    }
    return await (node as SketchText).interpretNode();
  }

  @override
  String getPBDLType() => PBDLOverrideTextValue.PBDL_TYPE_NAME;

  @override
  String getValue(OverridableValue overrideValue) => overrideValue.value;
}
