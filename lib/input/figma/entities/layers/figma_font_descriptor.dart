class FigmaFontDescriptor {
  String fontName;

  num fontSize;

  String fontWeight;

  String fontStyle;

  num letterSpacing;

  Map<String, dynamic> rawAttributes;

  FigmaFontDescriptor(
    this.fontName,
    this.fontSize,
    this.rawAttributes,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
  );
}
