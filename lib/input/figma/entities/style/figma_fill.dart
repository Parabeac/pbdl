import 'package:pbdl/input/figma/entities/style/figma_color.dart';
import 'package:json_annotation/json_annotation.dart';
part 'figma_fill.g.dart';

@JsonSerializable()
class FigmaFill {
  FigmaColor color;

  FigmaFill(this.color, [this.isEnabled = true]);

  bool isEnabled;

  Map<String, dynamic> toJson() => _$FigmaFillToJson(this);
  factory FigmaFill.fromJson(Map<String, dynamic> json) =>
      _$FigmaFillFromJson(json);
}
