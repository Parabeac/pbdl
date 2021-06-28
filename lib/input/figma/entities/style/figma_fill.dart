

import 'package:pbdl/input/figma/entities/style/figma_color.dart';

part 'figma_fill.g.dart';

@JsonSerializable()
class FigmaFill implements PBFill {
  @override
  PBColor color;

  FigmaFill(FigmaColor this.color, [this.isEnabled = true]);

  @override
  bool isEnabled;

  Map<String, dynamic> toJson() => _$FigmaFillToJson(this);
  factory FigmaFill.fromJson(Map<String, dynamic> json) =>
      _$FigmaFillFromJson(json);
}
