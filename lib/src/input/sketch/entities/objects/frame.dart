import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';

part 'frame.g.dart';

@JsonSerializable()
class Frame {
  @JsonKey(name: '_class')
  final String classField;
  final bool constrainProportions;
  @override
  double height, width, x, y;
  Frame({
    this.classField,
    this.constrainProportions,
    this.x,
    this.y,
    this.width,
    this.height,
  });
  factory Frame.fromJson(Map<String, dynamic> json) => _$FrameFromJson(json);
  Map<String, dynamic> toJson() => _$FrameToJson(this);

  PBDLFrame interpretFrame() {
    return PBDLFrame(
      classField: classField,
      constrainProportions: constrainProportions,
      x: x,
      y: y,
      width: width,
      height: height,
    );
  }
}
