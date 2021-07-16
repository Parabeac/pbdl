import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';

import 'figma_color.dart';
part 'figma_fill.g.dart';

@JsonSerializable()
class FigmaFill {
  FigmaColor color;

  FigmaFill(this.color, [this.isEnabled = true]);

  bool isEnabled;

  Map<String, dynamic> toJson() => _$FigmaFillToJson(this);
  factory FigmaFill.fromJson(Map<String, dynamic> json) =>
      _$FigmaFillFromJson(json);

  PBDLFill interpretFill() {
    return PBDLFill(color?.interpretColor());
  }
}
