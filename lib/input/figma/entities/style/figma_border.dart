import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/input/figma/entities/style/figma_color.dart';

part 'figma_border.g.dart';

@JsonSerializable()
class FigmaBorder {
  final bool isEnabled;

  final double fillType;

  final FigmaColor color;

  final double thickness;

  FigmaBorder({
    this.isEnabled,
    this.fillType,
    this.color,
    this.thickness,
  });

  Map<String, dynamic> toJson() => _$FigmaBorderToJson(this);
  factory FigmaBorder.fromJson(Map<String, dynamic> json) =>
      _$FigmaBorderFromJson(json);
}
