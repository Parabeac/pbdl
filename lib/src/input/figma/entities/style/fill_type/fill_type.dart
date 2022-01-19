import 'dart:math';

import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';

abstract class FillType {}

class GradientFillType extends FillType {
  GradientTypeEnum type;
  List<GradientStop> gradientStops;
  List<Point> gradientHandlePositions;
}

enum GradientTypeEnum {
  LINEAR,
  RADIAL,
  ANGULAR,
  DIAMOND,
}

class ImageFillType extends FillType {
  // String that identifies the ID of the image
  String imageRef;
}

class GradientStop {
  FigmaColor color;
  num position;
}
