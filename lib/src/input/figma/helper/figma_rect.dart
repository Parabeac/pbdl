import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';

part 'figma_rect.g.dart';

@JsonSerializable()
class FigmaRect {
  FigmaRect({
    this.x,
    this.y,
    this.z,
    this.width,
    this.height,
  });

  double? x;
  double? y;
  double? z;
  double? width;
  double? height;

  @override
  factory FigmaRect.fromJson(Map<String, dynamic> json) =>
      _$FigmaRectFromJson(json);

  Map<String, dynamic> toJson() => _$FigmaRectToJson(this);

  PBDLBoundaryBox interpretFrame() {
    return PBDLBoundaryBox(
      x: x,
      y: y,
      z: z,
      width: width,
      height: height,
      constrainProportions: false,
    );
  }
}
