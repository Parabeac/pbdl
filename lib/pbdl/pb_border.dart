import 'color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_border.g.dart';

@JsonSerializable()
abstract class PBBorder {
  final bool isEnabled;
  final double fillType;
  final PBColor color;
  final double thickness;

  PBBorder({
    this.isEnabled = true,
    this.fillType,
    this.color,
    this.thickness,
  });

  factory PBBorder.fromJson(Map<String, dynamic> json) =>
      _$PBBorderFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBBorderToJson(this);
}
