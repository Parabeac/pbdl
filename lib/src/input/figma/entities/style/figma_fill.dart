import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/fill/figma_fill_factory.dart';
import 'package:pbdl/src/input/figma/entities/style/style_addition.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import 'figma_color.dart';

part 'figma_fill.g.dart';

@JsonSerializable(createFactory: false)
abstract class FigmaFill implements StyleAdditionNode {
  FigmaColor? color;

  @JsonKey(defaultValue: 100)
  num? opacity;

  String? blendMode;

  @override
  String? type;

  @JsonKey(defaultValue: true)
  bool? visible;

  FigmaFill(
    this.opacity,
    this.blendMode,
    this.type,
    this.visible,
    this.color,
  );

  Map<String, dynamic> toJson();
  FigmaFill createFigmaFill(Map<String, dynamic>? json) =>
      FigmaFill.fromJson(json);
  factory FigmaFill.fromJson(Map<String, dynamic>? json) =>
      FigmaFillFactory.getFill(json)!;

  PBDLFill interpretFill() {
    return PBDLFill(
      opacity: opacity,
      blendMode: blendMode,
      type: type,
      isEnabled: visible,
      color: color!.interpretColor(),
    );
  }
}
