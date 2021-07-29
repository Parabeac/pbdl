import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_font_descriptor.dart';

part 'font_descriptor.g.dart';

@JsonSerializable()
class FontDescriptor {
  @JsonKey(name: 'attributes')
  Map<String, dynamic> rawAttributes;
  @JsonKey(ignore: true)
  String fontName;
  @JsonKey(ignore: true)
  num fontSize;
  @JsonKey(ignore: true)
  String fontWeight;
  @JsonKey(ignore: true)
  String fontStyle;
  @JsonKey(ignore: true)
  num letterSpacing;

  FontDescriptor({this.rawAttributes}) {
    fontSize = rawAttributes['size'];
    fontName = rawAttributes['name'];
  }

  factory FontDescriptor.fromJson(Map<String, dynamic> json) =>
      _$FontDescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$FontDescriptorToJson(this);

  PBDLFontDescriptor interpretFontDescriptor() {
    return PBDLFontDescriptor(
      fontName: fontName,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }
}
