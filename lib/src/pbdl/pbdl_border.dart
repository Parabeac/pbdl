import 'pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_border.g.dart';

@JsonSerializable(explicitToJson: true)
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
      _$PBDLBorderFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLBorderToJson(this);
}
