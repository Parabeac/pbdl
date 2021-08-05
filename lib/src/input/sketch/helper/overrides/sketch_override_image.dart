import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_image.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/objects/override_value.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideImage extends SketchOverrideType {
  @override
  final TYPE_NAME = 'image';

  @override
  Future<PBDLImage> getProperty(SketchNode node) async {
    return await node
        .interpretNode();
  }

  @override
  String getPBDLType() => PBDLOverrideImage.PBDL_TYPE_NAME;

  @override
  String getValue(OverridableValue overrideValue) => overrideValue.value['_ref'];
}
