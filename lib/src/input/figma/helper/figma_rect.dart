import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';

part 'figma_rect.g.dart';

@JsonSerializable()
class FigmaRect {
  FigmaRect({
    this.x,
    this.y,
    this.width,
    this.height,
  });

  double x;
  double y;
  double width;
  double height;

  @override
  factory FigmaRect.fromJson(Map<String, dynamic> json) =>
      _$FigmaRectFromJson(json);

  Map<String, dynamic> toJson() => _$FigmaRectToJson(this);

  PBDLFrame interpretFrame() {
    return PBDLFrame(
      x: x,
      y: y,
      width: width,
      height: height,
    );
  }
}
