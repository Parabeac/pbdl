

import 'package:pbdl/input/figma/entities/style/figma_color.dart';


part 'figma_border.g.dart';

@JsonSerializable()
class FigmaBorder implements PBBorder {
  @override
  final bool isEnabled;
  @override
  final double fillType;
  @override
  final FigmaColor color;
  @override
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
