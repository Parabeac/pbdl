import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../pbdl.dart';

part 'pbdl_fill.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLFill {
  PBDLColor color;

  @JsonKey(defaultValue: 100)
  num opacity;

  String blendMode;

  String type;

  @JsonKey(defaultValue: true)
  bool visible;

  final pbdlType = 'fill';

  PBDLFill({
    this.opacity,
    this.blendMode,
    this.type,
    this.visible,
    this.color,
  });

  @override
  factory PBDLFill.fromJson(Map<String, dynamic> json) =>
      _$PBDLFillFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLFillToJson(this);
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
