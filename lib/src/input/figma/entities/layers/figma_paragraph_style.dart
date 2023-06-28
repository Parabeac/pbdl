import 'package:pbdl/src/pbdl/pbdl_paragraph_style.dart';

class FigmaParagraphStyle {
  int? alignment = ALIGNMENT.LEFT.index;

  FigmaParagraphStyle({this.alignment});

  PBDLParagraphStyle interpretParagraphStyle() {
    return PBDLParagraphStyle(alignment: alignment);
  }
}

enum ALIGNMENT {
  LEFT,
  RIGHT,
  CENTER,
  JUSTIFY,
}
