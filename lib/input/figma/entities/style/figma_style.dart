import 'package:pbdl/input/figma/entities/style/figma_border.dart';
import 'package:pbdl/input/figma/entities/style/figma_border_options.dart';
import 'package:pbdl/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/input/figma/entities/style/figma_text_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/input/helper/pb_color.dart';
part 'figma_style.g.dart';

@JsonSerializable()
class FigmaStyle {
  PBColor backgroundColor;
  @override
  List<FigmaFill> fills = [];
  @override
  List<FigmaBorder> borders;
  @override
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
  factory FigmaStyle.fromJson(Map<String, dynamic> json) =>
      _$FigmaStyleFromJson(json);

  @override
  @JsonKey(ignore: true)
  bool hasShadow;
}
