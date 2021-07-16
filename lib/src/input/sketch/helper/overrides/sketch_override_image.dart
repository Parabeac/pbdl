import 'dart:ffi';

import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_image.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideImage extends SketchOverrideType {
  @override
  Future<Uint8> getValue(SketchNode node) {
    throw UnimplementedError(); // TODO: implement this once we know what images will look like in PBDL
  }

  @override
  String getPBDLType() => PBDLOverrideImage.PBDL_TYPE_NAME;
}
