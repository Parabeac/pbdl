import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_text_style.dart';
import 'figma_effect.dart';
import 'figma_stroke.dart';

part 'figma_style_property.g.dart';

@JsonSerializable()
class FigmaStyleProperty {
  List<FigmaFill>? fills;
  FigmaStroke? stroke;
  List<FigmaEffect>? effects;
  bool? clipsContent;

  FigmaStyleProperty({
    this.fills,
    this.stroke,
    this.effects,
    this.clipsContent,
  });

  factory FigmaStyleProperty.fromJson(Map<String, dynamic> json) =>
      _$FigmaStylePropertyFromJson(json);

  Map<String, dynamic> toJson() => _$FigmaStylePropertyToJson(this);

  PBDLStyle interpretStyle([FigmaTextStyle? textStyle]) {
    return PBDLStyle(
      fills: fills!.map((fill) => fill.interpretFill()).toList(),
      borderOptions: stroke!.interpretStroke(),
      effects: effects!.map((effect) => effect.interpretEffect()).toList(),
      textStyle: textStyle?.interpretTextStyle(),
      clipsContent: clipsContent,
    );
  }
}
