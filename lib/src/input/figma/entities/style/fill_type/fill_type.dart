import 'dart:math';

import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';

abstract class FillType {}

class GradientFillType extends FillType {
  List<GradientStop> gradientStops;
}

class GradientStop {
  FigmaColor color;
  num position;
}
