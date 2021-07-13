import 'package:pbdl/src/pbdl/pbdl_font_descriptor.dart';

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

  PBDLFontDescriptor interpretFontDescriptor() {
    return PBDLFontDescriptor(
      fontName: fontName,
      fontSize: num.parse(fontName),
      rawAttributes: rawAttributes,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }
}
