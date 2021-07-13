import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_border.dart';
import 'figma_color.dart';

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

  PBDLBorder interpretBorder() {
    return PBDLBorder(
      isEnabled: isEnabled,
      fillType: fillType,
      color: color?.interpretColor(),
      thickness: thickness,
    );
  }
}
