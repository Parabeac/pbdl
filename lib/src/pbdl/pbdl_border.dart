import 'pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_border.g.dart';

@JsonSerializable()
class PBDLBorder {
  final bool isEnabled;
  final double fillType;
  final PBDLColor color;
  final double thickness;

  PBDLBorder({
    this.isEnabled = true,
    this.fillType,
    this.color,
    this.thickness,
  });

  factory PBDLBorder.fromJson(Map<String, dynamic> json) =>
      _$PBBorderFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBBorderToJson(this);
}
