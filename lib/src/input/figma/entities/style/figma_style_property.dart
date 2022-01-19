import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'figma_effect.dart';
import 'figma_stroke.dart';

part 'figma_style_property.g.dart';

@JsonSerializable()
class FigmaStyleProperty {
  List<FigmaFill> fills;
  List<FigmaStroke> strokes;
  List<FigmaEffect> effects;

  FigmaStyleProperty(
    this.fills,
    this.strokes,
    this.effects,
  );

  factory FigmaStyleProperty.fromJson(Map<String, dynamic> json) =>
      _$FigmaStylePropertyFromJson(json);

  Map<String, dynamic> toJson() => _$FigmaStylePropertyToJson(this);
}
