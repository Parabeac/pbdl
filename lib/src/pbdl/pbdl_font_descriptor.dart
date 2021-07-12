import 'package:json_annotation/json_annotation.dart';

part 'pbdl_font_descriptor.g.dart';

@JsonSerializable()
class PBDLFontDescriptor {
  PBDLFontDescriptor({this.fontName, this.fontSize, this.rawAttributes});
  Map<String, dynamic> rawAttributes;
  String fontName;
  num fontSize;

  @override
  factory PBDLFontDescriptor.fromJson(Map<String, dynamic> json) =>
      _$PBDLFontDescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLFontDescriptorToJson(this);
}
