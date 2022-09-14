import 'package:pbdl/src/input/figma/entities/style/style_addition.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';

import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';

import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';

import 'dart:math';

import 'gradient_fill_type.dart';

class LinearGradientFillType implements GradientFillType {
  @override
  String blendMode;

  @override
  FigmaColor color;

  @override
  List<Point<num>> gradientHandlePositions;

  @override
  List<GradientStop> gradientStops;

  @override
  num opacity;

  @override
  String type;

  @override
  bool visible;

  @override
  FigmaFill createFigmaFill(Map<String, dynamic> json) {
    // TODO: implement createFigmaFill
    throw UnimplementedError();
  }

  @override
  PBDLFill interpretFill() {
    // TODO: implement interpretFill
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  String addStyle(StyleAdditionNode style) {
    // TODO: implement addStyle
    throw UnimplementedError();
  }
}
