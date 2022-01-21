import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';

part 'figma_list_stroke.g.dart';

@JsonSerializable()
class FigmaListStroke {
  String blendMode;

  String type;

  FigmaColor color;

  @JsonKey(defaultValue: true)
  bool visible;

  FigmaListStroke({
    this.blendMode,
    this.type,
    this.color,
  });

  Map<String, dynamic> toJson() => _$FigmaListStrokeToJson(this);
  factory FigmaListStroke.fromJson(Map<String, dynamic> json) =>
      _$FigmaListStrokeFromJson(json);
}
