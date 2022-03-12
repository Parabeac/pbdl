import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/fill/figma_fill_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import '../../../../../pbdl.dart';
import 'figma_color.dart';

part 'figma_fill.g.dart';

@JsonSerializable()
class FigmaFill {
  FigmaColor color;

  @JsonKey(defaultValue: 100)
  num opacity;

  String blendMode;

  String type;

  @JsonKey(defaultValue: true)
  bool visible;

  FigmaFill(
    this.opacity,
    this.blendMode,
    this.type,
    this.visible,
    this.color,
  );

  Map<String, dynamic> toJson() {}
  FigmaFill createFigmaFill(Map<String, dynamic> json) =>
      FigmaFill.fromJson(json);
  factory FigmaFill.fromJson(Map<String, dynamic> json) =>
      FigmaFillFactory.getFill(json);

  PBDLFill interpretFill() {
    return PBDLFill(
      opacity: opacity,
      blendMode: blendMode,
      type: type,
      isEnabled: visible,
      color: color.interpretColor(),
    );
  }

  // Future<PBDLStyle> interpretStyle() async {
  //   var interpretedFills = await Future.wait(
  //       fills.map((e) async => await e.interpretNode()).toList());
  //   return PBDLStyle(
  //     backgroundColor: backgroundColor?.interpretColor(),
  //     fills: interpretedFills,
  //     borders: borders.map((e) => e.interpretBorder()).toList(),
  //     borderOptions: borderOptions?.interpretOptions(),
  //     textStyle: textStyle?.interpretTextStyle(),
  //     hasShadow: false,
  //   );
  // }
}

// enum BlendMode {
//   NORMAL,
//   DARKEN,
//   MULTIPLY,
//   COLOR_BURN,
//   LIGHTEN,
//   SCREEN,
//   COLOR_DODGE,
//   OVERLAY,
//   SOFT_LIGHT,
//   HARD_LIGHT,
//   DIFFERENCE,
//   EXCLUSION,
//   HUE,
//   SATURATION,
//   COLOR,
//   LUMINOSITY,
// }
