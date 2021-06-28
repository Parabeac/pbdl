//no proposed solution for FigmaStyle

import 'package:pbdl/input/figma/entities/style/figma_border.dart';
import 'package:pbdl/input/figma/entities/style/figma_border_options.dart';
import 'package:pbdl/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/input/figma/entities/style/figma_text_style.dart';

part 'figma_style.g.dart';

@JsonSerializable()
class FigmaStyle implements PBStyle {
  @override
  PBColor backgroundColor;
  @override
  List<PBFill> fills = [];
  @override
  List<PBBorder> borders;
  @override
  PBTextStyle textStyle;

  FigmaStyle({
    FigmaColor this.backgroundColor,
    List<FigmaBorder> this.borders,
    List<FigmaFill> this.fills,
    FigmaTextStyle this.textStyle,
    FigmaBorderOptions this.borderOptions,
  }) {
    if (this.fills == null) {
      this.fills = [];
    }
  }

  @override
  PBBorderOptions borderOptions;

  Map<String, dynamic> toJson() => _$FigmaStyleToJson(this);
  factory FigmaStyle.fromJson(Map<String, dynamic> json) =>
      _$FigmaStyleFromJson(json);

  @override
  @JsonKey(ignore: true)
  bool hasShadow;
}
