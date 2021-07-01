//Nothing to import

import 'package:pbdl/design_logic/rect.dart';

part 'frame.g.dart';

@JsonSerializable(nullable: true)
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
  factory PBDLFrame.fromJson(Map<String, dynamic> json) => _$FrameFromJson(json);
  Map<String, dynamic> toJson() => _$FrameToJson(this);
}
