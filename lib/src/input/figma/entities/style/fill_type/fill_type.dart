import 'dart:math';

abstract class FillType {
  GradientType type;

  // TODO: determine type of list
  List<Point> stops;
}

enum GradientType {
  SOLID,
  LINEAR,
  RADIAL,
  ANGULAR,
  DIAMOND,
  IMAGE,
}
