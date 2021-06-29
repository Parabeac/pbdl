import 'package:pbdl/input/figma/entities/layers/figma_font_descriptor.dart';
import 'package:pbdl/input/figma/entities/layers/figma_paragraph_style.dart';
import 'package:pbdl/input/figma/entities/style/figma_color.dart';
import 'package:json_annotation/json_annotation.dart';
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
}
