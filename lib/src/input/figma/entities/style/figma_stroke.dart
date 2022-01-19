import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';

part 'figma_stroke.g.dart';

@JsonSerializable()
class FigmaStroke {
  String blendMode;

  String type;

  FigmaColor color;

  FigmaStroke({
    this.blendMode,
    this.type,
    this.color,
  });

  Map<String, dynamic> toJson() => _$FigmaStrokeToJson(this);
  factory FigmaStroke.fromJson(Map<String, dynamic> json) =>
      _$FigmaStrokeFromJson(json);
}
