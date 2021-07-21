import 'package:json_annotation/json_annotation.dart';

part 'pbdl_frame.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLFrame {
  @JsonKey(name: 'type')
  final String classField;
  final bool constrainProportions;
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

  final type = 'frame';
}
