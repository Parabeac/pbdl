import 'dart:math';

import '../figma_color.dart';
import 'fill_type.dart';

class GradientFillType implements FillType {
  List<GradientStop> gradientStops;
  List<Point> gradientHandlePositions;

  @override
  FillTypeEnum type;
}

class GradientStop {
  FigmaColor color;
  num position;
}
