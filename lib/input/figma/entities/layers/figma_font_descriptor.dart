//was not given option to import library packahge for PBfontDescriptor

class FigmaFontDescriptor implements PBFontDescriptor {
  @override
  String fontName;

  @override
  num fontSize;

  String fontWeight;

  String fontStyle;

  num letterSpacing;

  @override
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
