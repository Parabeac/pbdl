

import 'package:pbdl/input/figma/entities/style/figma_color.dart';

part 'figma_text_style.g.dart';

@JsonSerializable()
class FigmaTextStyle implements PBTextStyle {
  @override
  PBColor fontColor;

  @override
  String weight;

  @JsonKey(ignore: true)
  @override
  PBFontDescriptor fontDescriptor;

  @override
  @JsonKey(ignore: true)
  PBParagraphStyle paragraphStyle;

  FigmaTextStyle({
    FigmaColor this.fontColor,
    this.fontDescriptor,
    this.weight,
    this.paragraphStyle,
  });

  Map<String, dynamic> toJson() => _$FigmaTextStyleToJson(this);
  factory FigmaTextStyle.fromJson(Map<String, dynamic> json) =>
      _$FigmaTextStyleFromJson(json);
}
