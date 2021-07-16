import 'package:json_annotation/json_annotation.dart';

part 'pbdl_font_descriptor.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLFontDescriptor {
  PBDLFontDescriptor({
    this.fontName,
    this.fontSize,
    this.rawAttributes,
    this.fontStyle,
    this.fontWeight,
    this.letterSpacing,
  });
  Map<String, dynamic> rawAttributes;
  String fontName;
  num fontSize;
  String fontWeight;

  String fontStyle;

  num letterSpacing;

  @override
  factory PBDLFontDescriptor.fromJson(Map<String, dynamic> json) =>
      _$PBDLFontDescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLFontDescriptorToJson(this);
}
