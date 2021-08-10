import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';

part 'sketch_rect.g.dart';

@JsonSerializable()
class SketchRect {
  @JsonKey(name: '_class')
  final String classField;
  final bool constrainProportions;
  double height, width, x, y;
  SketchRect({
    this.classField,
    this.constrainProportions,
    this.x,
    this.y,
    this.width,
    this.height,
  });
  factory SketchRect.fromJson(Map<String, dynamic> json) =>
      _$SketchRectFromJson(json);
  Map<String, dynamic> toJson() => _$SketchRectToJson(this);

  PBDLFrame interpretFrame() {
    return PBDLFrame(
      constrainProportions: constrainProportions,
      x: x,
      y: y,
      width: width,
      height: height,
    );
  }
}
