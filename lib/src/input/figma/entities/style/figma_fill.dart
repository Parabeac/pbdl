import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import 'figma_color.dart';
import 'fill_type/fill_type.dart';

part 'figma_fill.g.dart';

@JsonSerializable()
class FigmaFill {
  FigmaColor color;

  BlendMode blendMode;
  FillType fillType;

  FigmaFill(this.color, [this.isEnabled = true]);

  @JsonKey(defaultValue: true)
  bool isEnabled;

  Map<String, dynamic> toJson() => _$FigmaFillToJson(this);
  factory FigmaFill.fromJson(Map<String, dynamic> json) =>
      _$FigmaFillFromJson(json);

  PBDLFill interpretFill() {
    return PBDLFill(
      color?.interpretColor(),
      isEnabled,
    );
  }
}

enum BlendMode {
  NORMAL,
  DARKEN,
  MULTIPLY,
  COLOR_BURN,
  LIGHTEN,
  SCREEN,
  COLOR_DODGE,
  OVERLAY,
  SOFT_LIGHT,
  HARD_LIGHT,
  DIFFERENCE,
  EXCLUSION,
  HUE,
  SATURATION,
  COLOR,
  LUMINOSITY,
}
// enum FillType {
//   SOLID,
//   LINEAR,
//   RADIAL,
//   ANGULAR,
//   DIAMOND,
//   IMAGE,
// }

// abstract class FillType {}
