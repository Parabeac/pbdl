import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_text_style.dart';

import '../layers/figma_font_descriptor.dart';
import '../layers/figma_paragraph_style.dart';
import 'figma_color.dart';
part 'figma_text_style.g.dart';

@JsonSerializable()
class FigmaTextStyle {
  FigmaColor fontColor;

  String weight;

  @JsonKey(ignore: true)
  FigmaFontDescriptor fontDescriptor;

  @JsonKey(ignore: true)
  FigmaParagraphStyle paragraphStyle;

  FigmaTextStyle({
    FigmaColor this.fontColor,
    this.fontDescriptor,
    this.weight,
    this.paragraphStyle,
  });

  Map<String, dynamic> toJson() => _$FigmaTextStyleToJson(this);
  factory FigmaTextStyle.fromJson(Map<String, dynamic> json) =>
      _$FigmaTextStyleFromJson(json);

  PBDLTextStyle interpretTextStyle() {
    return PBDLTextStyle(
      fontColor: fontColor.interpretColor(),
      weight: weight,
      paragraphStyle: paragraphStyle.interpretParagraphStyle(),
      fontDescriptor: fontDescriptor.interpretFontDescriptor(),
    );
  }
}
