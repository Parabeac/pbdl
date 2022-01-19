import 'dart:math';

import '../figma_color.dart';
import 'fill_type.dart';

class GradientFillType implements FillType {
  List<Point> gradientHandlePosition;

  @override
  List<Point> stops;

  @override
  GradientType type;
}

class GradientStop {
  FigmaColor color;
  num position;
}
