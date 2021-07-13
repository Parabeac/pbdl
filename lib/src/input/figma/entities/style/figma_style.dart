import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

import 'figma_border.dart';
import 'figma_border_options.dart';
import 'figma_color.dart';
import 'figma_fill.dart';
import 'figma_text_style.dart';
part 'figma_style.g.dart';

@JsonSerializable()
class FigmaStyle {
  @JsonKey(nullable: true)
  FigmaColor backgroundColor;
  List<FigmaFill> fills = [];
  List<FigmaBorder> borders;
  FigmaTextStyle textStyle;

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

  FigmaBorderOptions borderOptions;

  Map<String, dynamic> toJson() => _$FigmaStyleToJson(this);
  factory FigmaStyle.fromJson(Map<String, dynamic> json) {
    return _$FigmaStyleFromJson(json);
  }

  PBDLStyle interpretStyle() {
    return PBDLStyle(
      backgroundColor: backgroundColor?.interpretColor(),
      fills: fills.map((e) => e.interpretFill()).toList(),
      borders: borders.map((e) => e.interpretBorder()).toList(),
      borderOptions: borderOptions?.interpretOptions(),
      textStyle: textStyle?.interpretTextStyle(),
    );
  }

  @override
  @JsonKey(ignore: true)
  bool hasShadow;
}
