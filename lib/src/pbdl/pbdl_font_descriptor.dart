import 'package:json_annotation/json_annotation.dart';

part 'pbdl_font_descriptor.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLFontDescriptor {
  PBDLFontDescriptor({
    this.fontName,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.letterSpacing,
  });
  String? fontName;
  num? fontSize;
  String? fontWeight;

  String? fontStyle;

  num? letterSpacing;

  final type = 'font_descriptor';

  @override
  factory PBDLFontDescriptor.fromJson(Map<String, dynamic> json) =>
      _$PBDLFontDescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLFontDescriptorToJson(this);
}
