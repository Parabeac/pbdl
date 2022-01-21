import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_list_stroke.dart';

part 'figma_stroke.g.dart';

@JsonSerializable()
class FigmaStroke {
  List<FigmaListStroke> strokes;

  num strokeWeight;

  String strokeAlign;

  String strokeJoin;

  List strokeDashes;

  num cornerRadius;

  FigmaStroke({
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.strokeJoin,
    this.strokeDashes,
    this.cornerRadius,
  });

  Map<String, dynamic> toJson() => _$FigmaStrokeToJson(this);
  factory FigmaStroke.fromJson(Map<String, dynamic> json) =>
      _$FigmaStrokeFromJson(json);
}
