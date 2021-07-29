import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_image.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideImage extends SketchOverrideType {
  @override
  final TYPE_NAME = 'image';

  @override
  Future<String> getValue(SketchNode node) {
    return Future.value(
        'path'); // TODO: implement this once we know what images will look like in PBDL
  }

  @override
  String getPBDLType() => PBDLOverrideImage.PBDL_TYPE_NAME;
}
