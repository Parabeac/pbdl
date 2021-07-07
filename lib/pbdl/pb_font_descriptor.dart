import 'package:json_annotation/json_annotation.dart';

part 'pb_font_descriptor.g.dart';

@JsonSerializable()
class PBFontDescriptor {
  PBFontDescriptor({this.fontName, this.fontSize, this.rawAttributes});
  Map<String, dynamic> rawAttributes;
  String fontName;
  num fontSize;

  @override
  factory PBFontDescriptor.fromJson(Map<String, dynamic> json) =>
      _$PBFontDescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$PBFontDescriptorToJson(this);
}
