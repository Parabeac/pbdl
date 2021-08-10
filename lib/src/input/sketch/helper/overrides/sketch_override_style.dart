import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_style.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/objects/override_value.dart';
import 'package:pbdl/src/input/sketch/entities/style/style.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideStyle extends SketchOverrideType {
  @override
  final String TYPE_NAME = 'style';

  @override
  Future<PBDLStyle> getProperty(SketchNode node) async {
    if (node is! Style) {
      return null;
    }
    return Future.value((node as Style).interpretStyle());
  }

  @override
  String getPBDLType() => PBDLOverrideStyle.PBDL_TYPE_NAME;

  @override
  String getValue(OverridableValue overrideValue) => overrideValue.value;
}
