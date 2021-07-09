class FigmaParagraphStyle {
  int alignment = ALIGNMENT.LEFT.index;

  FigmaParagraphStyle({this.alignment});
}

enum ALIGNMENT {
  LEFT,
  RIGHT,
  CENTER,
  JUSTIFY,
}
