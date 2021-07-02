import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/rect.dart';

part 'pbdl_frame.g.dart';

@JsonSerializable()
class PBDLFrame implements Rect {
  @JsonKey(name: '_class')
  final String classField;
  final bool constrainProportions;
  @override
  double height, width, x, y;
  PBDLFrame({
    this.classField,
    this.constrainProportions,
    this.x,
    this.y,
    this.width,
    this.height,
  });
  factory PBDLFrame.fromJson(Map<String, dynamic> json) =>
      _$PBDLFrameFromJson(json);
  Map<String, dynamic> toJson() => _$PBDLFrameToJson(this);
}
